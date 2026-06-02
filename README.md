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
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Sphinx is used to build the documentation: https://sphinx-doc.org/

The sphinx-autobuild is used for local testing.

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.

The internationalization is built using [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)

To download the translations from Transifex (optional), you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client

```
pip install transifex-client
```

## Continuous integration

The website is built and published automatically by a Jenkins pipeline defined in `Jenkinsfile`. The pipeline:

- Builds the site with `sphinx-build` inside a Docker agent (see `buildtools/Dockerfile.build`)
- Publishes the result to [https://geonetwork-opensource.org](https://geonetwork-opensource.org) via rsync over SSH
- Runs daily