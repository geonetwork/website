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

### Building the website

First checkout the website source:

```bash
  git clone -b master https://github.com/geonetwork/website.git website
```
Then use the shell script:

```bash
  cd website
  mvn install
```

Once the website has been built, you only have to move the contents of the ``target/website`` folder to the proper URL to publish the website on https://geonetwork-opensource.org.
