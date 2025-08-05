[![CLA assistant](https://cla-assistant.io/readme/badge/geonetwork/geonetwork)](https://cla-assistant.io/geonetwork/geonetwork)

# Website

GeoNetwork opensource website project. The content of this repository is deployed as a website at http://geonetwork-opensource.org

* [GeoNetwork-opensource](https://geonetwork-opensource.org) (WebSite)

## Website build

### Local build

Quick build on command line:
```
sphinx-build -a -b html docsrc target/website
```

Or with maven:
```
mvn prepare-package
```

### Local test

Test locally in browser while writing:
```
sphinx-autobuild -a docsrc target/website
```

Use browser to preview: http://127.0.0.1:8000

### Installing the tools

Python virtual environment:
```
virtualenv venv
```
```
source venv/bin/activate
```
```
pip install -r requirements.txt
```

Sphinx is used to build the documentation: https://sphinx-doc.org/

The sphinx-autobuild is used for local testing.

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.

The internationalization is build used [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)

To download the translations from Transifex (optional), you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client

The Transifex Client is written in Python, so it runs on most systems. The easiest way to install it is with pip: