[![CLA assistant](https://cla-assistant.io/readme/badge/geonetwork/geonetwork)](https://cla-assistant.io/geonetwork/geonetwork)

# Website

GeoNetwork opensource website project. The content of this repository is deployed as a website at http://geonetwork-opensource.org

* [GeoNetwork-opensource](https://geonetwork-opensource.org) (WebSite)

## Website build

### Quick test

Quick test on command line:
```
sphinx-build -a -b html docsrc target/website
```

Or with maven:
```
mvn prepare-package
```

### Installing the tools

Python virtual environment:
```
virtualenv venv
```
```
source venv/bin/activate
```

Sphinx is used to build the documentation: https://sphinx-doc.org/

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.

The internationalization is build used [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)

To download the translations from Transifex (optional), you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client

The Transifex Client is written in Python, so it runs on most systems. The easiest way to install it is with pip:

You can install these with [pip](https://pip.pypa.io/en/stable/installing/):
```
pip install -r requirements.txt
```

### Configuring your local (Optional)

This is only needed if you want to build a multilingual documentation. In that case, you need to configure your 
Transifex user:
https://docs.transifex.com/client/client-configuration
~/.transifexrc stores your Transifex.com credentials. This config file is unique per user and it's stored in your home directory.

```
[https://www.transifex.com]
username = your_username/api
token =
password = p@ssw0rd/api_token
hostname = https://www.transifex.com
```
### Building the documentation

First checkout the website source:

```bash
  git clone -b master https://github.com/geonetwork/website.git website
```
Then use the shell script:

```bash
  cd website
  ./checkup_docs.sh
```

You can use parameters to make sure you build the website as you expect:
```bash
./checkup_docs.sh --help
Usage: ./checkup_docs only for basic english version
Usage: ./checkup_docs -Platest for English and French using latest translations on Transifex
Usage: ./checkup_docs -Pall for all languages using cached translations
Usage: ./checkup_docs -Platest,all for all languages using latest translations on transifex
```

Once the website has been built, you only have to move the contents of the ``build`` folder to the proper URL to publish the website on https://geonetwork-opensource.org.
