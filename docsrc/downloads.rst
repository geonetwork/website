.. _download:

Download GeoNetwork
===================

Releases
--------

 * `v3.0.2 (Current release) <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.0.2/>`_

 * `All releases <http://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource>`_

 * `Development releases (unstable)  <https://sourceforge.net/projects/geonetwork/files/GeoNetwork%20unstable%20development%20versions/>`_

Source code
-----------

 * `GitHub repository <https://github.com/geonetwork/core-geonetwork>`_

To checkout the current development version and build it, use::

    $ git clone --recursive git://github.com/geonetwork/core-geonetwork.git geonetwork
    $ cd geonetwork
    $ git checkout develop
    $ git submodule update --init
    $ mvn clean install

For more information, refer to the `developer guide <https://github.com/geonetwork/core-geonetwork/tree/develop/software_development>`_
