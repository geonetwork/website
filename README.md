# Website

GeoNetwork opensource website project. The content of this repository is deployed as a website at http://geonetwork-opensource.org

## Website build

### Installing the tools

To build the documentation you need to have [make](https://www.gnu.org/software/make/) installed in your system:

```
sudo apt-get install make
```

Sphinx is required to build documentation.See http://sphinx-doc.org/latest/install.html.
You can install it with [pip](https://pip.pypa.io/en/stable/installing/):
```
sudo easy_install pip
sudo pip install sphinx
```

The theme is based on [sphinx_rtd_theme](https://github.com/snide/sphinx_rtd_theme) and the sphinx_bootstrap_theme.
You can install the style with pip too:
```
sudo pip install sphinx-bootstrap-theme
sudo pip install sphinx_rtd_theme
```

The internationalization is build used [sphinx-intl](http://www.sphinx-doc.org/es/stable/intl.html)
You can install it with:

```
sudo pip install sphinx-intl
```

To download the translations from Transifex (optional), you will need the transifex command line client:
https://docs.transifex.com/client/installing-the-client
The Transifex Client is written in Python, so it runs on most systems. The easiest way to install it is with pip:

```
sudo pip install transifex-client
```

### Configuring your local (Optional)

This is only needed if you want to build documentation multilanguage. In that case, you need to configure your transifex user:
https://docs.transifex.com/client/client-configuration
~/.transifexrc stores your Transifex.com credentials. This config file is unique per user, and it's stored in your home directory.

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
Usage: ./checkpu_docs -Platest for English and French using latest translations on Transifex
Usage: ./checkup_docs -Pall for all languages using cached translations
Usage: ./checkup_docs -Platest,all for all languages using latest translations on transifex
```

The website is built, you just have to move the built folder to the proper path to publish the website on http://geonetwork-opensource.org
HOPE THIS HELPS YOU.
STAY TUNED FOR FUTURE ENDEVOURS.
