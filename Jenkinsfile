pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile.build'
            dir 'buildtools'
        }
    }

    triggers {
        githubPush()
        pollSCM('H 2 * * *')
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }

    stages {
        stage('Setup') {
            steps {
                sh label: 'setup', script: '''#!/bin/bash
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install -U pip setuptools wheel
                    pip install --no-cache-dir -r requirements.txt
                '''
            }
        }

        stage('Build') {
            steps {
                sh label: 'build', script: '''#!/bin/bash
                    source venv/bin/activate
                    sphinx-build -n -a -b html docsrc target/website
                '''
            }
        }

        stage('Publish') {
            environment {
                REMOTE_HOST = credentials('docs-remote-host')
                REMOTE_USER = credentials('docs-remote-user')
            }
            steps {
                echo 'Publishing GeoNetwork website...'
                withCredentials([sshUserPrivateKey(credentialsId: 'docs-ssh-key', keyFileVariable: 'SSH_KEY_FILE')]) {
                    sh label: 'Rsync', script: '''#!/bin/bash
                        echo "=== Publishing GeoNetwork website ==="

                        PUBLISHING_DIR=/opt/www-geonetwork-opensource

                        chmod 600 ${SSH_KEY_FILE}
                        SSH_OPTS="-i ${SSH_KEY_FILE} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

                        ssh ${SSH_OPTS} ${REMOTE_USER}@${REMOTE_HOST} "mkdir -p ${PUBLISHING_DIR}"
                        rsync --stats -rltDvh --no-owner --no-group \
                            -e "ssh ${SSH_OPTS}" \
                            ${WORKSPACE}/target/website/ \
                            ${REMOTE_USER}@${REMOTE_HOST}:${PUBLISHING_DIR}
                        ssh ${SSH_OPTS} ${REMOTE_USER}@${REMOTE_HOST} \
                            "find ${PUBLISHING_DIR} -type d -exec chmod 755 {} \\; && find ${PUBLISHING_DIR} -type f -exec chmod 644 {} \\;"
                        echo "=== Publication complete ==="
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded: cleaning up workspace'
            cleanWs()
        }
    }
}
