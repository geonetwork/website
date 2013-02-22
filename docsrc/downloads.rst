.. _download:

Download GeoNetwork
===================

Releases
--------

 * `v2.8.0 (Current release) <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v2.8.0/>`_

 * `All releases <http://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource>`_

 * `Development releases (unstable)  <https://sourceforge.net/projects/geonetwork/files/GeoNetwork%20unstable%20development%20versions/>`_

Source code
-----------

 * `GitHub repository <https://github.com/geonetwork/core-geonetwork>`_

To checkout the current development version and build it, use::

    $ git clone --recursive git://github.com/geonetwork/core-geonetwork.git master
    $ cd master
    $ git checkout master
    $ git submodule update --init
    $ mvn clean install

For more information, have a look to `the developer manual <developers/development/index.html>`_
