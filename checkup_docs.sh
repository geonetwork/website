#!/bin/bash

export MAVEN_OPTS="-Xmx512M"
MAVEN_PROFILES=$1

if [ "$1" == "--help" ]; then
  echo "Usage: ./checkup_docs only for basic english version"
  echo "Usage: ./checkpu_docs -Platest for English and French using latest translations on Transifex"
  echo "Usage: ./checkup_docs -Pall for all languages using cached translations"
  echo "Usage: ./checkup_docs -Platest,all for all languages using latest translations on Transifex"
  exit 0;
fi

current_dir=$(pwd)

tag210='2.10.4'
tagold='3.8.x'
branchold='3.8.x'
current='3.10.x'
pre_release='4.0.x'

###############################################################################
# Clones doc repo, change the branch or tag if it exists and build the 
# documents.
# 
# Params:
# $1: branch/tag name
#
# Example: build_docs 3.10.x
###############################################################################
function build_docs() {

  BRANCH_OR_TAG=$1

  # Download from GitHub docs to 'doc_X.Y.Z' folder
  echo "=======> Generating docs for $1 branch"
  cd $current_dir/target
  if [ ! -e "doc_${BRANCH_OR_TAG}" ]; then 
    echo "==========> No local clone found. Cloning it now"
    git clone https://github.com/geonetwork/doc.git doc_${BRANCH_OR_TAG}; 
    echo "==========> Checkout tag/branch ${BRANCH_OR_TAG}"
    cd doc_${BRANCH_OR_TAG}
    git checkout ${BRANCH_OR_TAG}
  else
    # If the folder already exists reuse it
    echo "==========> Local directory $current_dir/doc${BRANCH_OR_TAG} alredy exists. Skipping git clone command"
    cd doc_${BRANCH_OR_TAG};     
    echo "==========> Checkout tag/branch "${BRANCH_OR_TAG}
    git checkout ${BRANCH_OR_TAG}
    git pull
  fi

  git submodule update --init
  echo "=======> Build "${BRANCH_OR_TAG}" docs"
  mvn -B -q clean install -DskipTests $MAVEN_PROFILES
  echo "=======> "$BRANCH_OR_TAG" manuals created"
  
}


echo "=> WEBSITE CREATION STARTED"

mkdir -p $current_dir/target

# -------------------------------------------------------
# 2.10.4 branch documentation ---------------------------
# -------------------------------------------------------

# Download from GitHub master to 'core-geonetwork' folder"

# Create folder for 2.10.x branch to '210x' folder
echo "=======> Generating web for 2.10.x branch (tag "$tag210")"
cd $current_dir/target
if [ ! -e "web_210x" ]; then 
  echo "=======> Downloading from GitHub Geonetwork branch to 'core-geonetwork' folder"
  git clone -b ${tag210} --depth 1 git://github.com/geonetwork/core-geonetwork.git web_210x; 
fi

cd web_210x 
#echo "==========> Fetching remote info from repository"
#git fetch --tags
echo "==========> Checkout tag "$tag210
git checkout tags/$tag210
git submodule update --init --recursive

echo "=========> Build "$tag210" tag manuals"
# Build website docs for 2.10.x tag
cd docs
mvn -B clean install -DskipTests
echo "=========> "$tag210"  manuals created"

# -------------------------------------------------------
# 3.x.y branch documentation ---------------------------
# -------------------------------------------------------

# Download from GitHub docs to 'doc' folder
build_docs "${tagold}"
build_docs "${current}"
build_docs 'develop'
build_docs "${pre_release}"



# Build geonetwork-opensource website
# -------------------------------------------------------
echo "=> Building website"

cd $current_dir/docsrc
make clean
make html

# Copy GeoNetwork manuals to website folder (trunk)
# -------------------------------------------------------
echo "=======> Copy GeoNetwork 3.x.y docs to website folder"
mkdir -p $current_dir/docsrc/build/html/manuals/$tagold/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$tagold/fra/users

mkdir -p $current_dir/docsrc/build/html/manuals/$current/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$current/fra/users

mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/fra/users

mkdir -p $current_dir/docsrc/build/html/manuals/${pre_release}/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/${pre_release}/fra/users

# ... Users
# 3.x.y
cd $current_dir/target/doc_$tagold/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/$tagold/eng/users
cd $current_dir/target/doc_$tagold/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/$tagold/fra/users

cd $current_dir/target/doc_$current/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/$current/eng/users
cd $current_dir/target/doc_$current/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/$current/fra/users

cd $current_dir/target/doc_develop/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/eng/users
cd $current_dir/target/doc_develop/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/fra/users

# 4.x.y
cd $current_dir/target/doc_${pre_release}/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/${pre_release}/eng/users
cd $current_dir/target/doc_${pre_release}/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/${pre_release}/fra/users

#Copy i18n manuals
cp -R $current_dir/target/doc_$tagold/target/doc/* $current_dir/docsrc/build/html/manuals/$tagold/
cp -R $current_dir/target/doc_$current/target/doc/* $current_dir/docsrc/build/html/manuals/$current/
cp -R $current_dir/target/doc_develop/target/doc/* $current_dir/docsrc/build/html/manuals/trunk/
cp -R $current_dir/target/doc_${pre_release}/target/doc/* $current_dir/docsrc/build/html/manuals/${pre_release}/





# Copy docs to website folder (2.10.x)
# -------------------------------------------------------
echo "=======> Copy GeoNetwork 2.10.x docs to website folder"
mkdir -p $current_dir/docsrc/build/html/manuals/$tag210/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$tag210/eng/developer

# ... Users
cd $current_dir/target/web_210x/docs/eng/users/build
cp -R html/* $current_dir/docsrc/build/html/manuals/$tag210/eng/users
cp -R latex/GeoNetworkUserManual.pdf $current_dir/docsrc/build/html/manuals/$tag210/eng/users

# ... Developer
cd $current_dir/target/web_210x/docs/eng/developer/build
cp -R html/* $current_dir/docsrc/build/html/manuals/$tag210/eng/developer
cp -R latex/GeoNetworkDeveloperManual.pdf $current_dir/docsrc/build/html/manuals/$tag210/eng/developer

echo "=======> Website creation finished"
echo "=======> Website files are in  ${current_dir}/docsrc/build/html"
