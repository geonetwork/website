.. _download:

Download GeoNetwork
===================

Releases
--------


 * `v4.0.0 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v4.0.0/>`_ - Before migrating to version 4.0.0, read carefully the `list of missing features <https://github.com/geonetwork/core-geonetwork/issues/4727>`_.

 * `v4.0.0-alpha.2 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_unstable_development_versions/4.0.0-alpha.2/>`_

 * `v4.0.0-alpha.1 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_unstable_development_versions/4.0.0-alpha.1/>`_

 * `v3.10.4 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.10.4/>`_

 * `v3.10.3 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.10.3/>`_

 * `v3.10.2 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.10.2/>`_

 * `v3.10.1  <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.10.1/>`_

 * `v3.10.0 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.10.0/>`_

 * `v3.8.3 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.8.3/>`_

 * `v3.8.2 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.8.2/>`_

 * `v3.8.1 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.8.1/>`_

 * `v3.8.0 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.8.0/>`_

 * `v3.6.0 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.6.0/>`_

 * `v3.4.4 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.4.4/>`_

 * `v3.2.2  <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.2.2/>`_

 * `v3.0.5 <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v3.0.5/>`_

 * `All releases <http://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource>`_

 * `Nightly builds <http://nightlybuild.geonetwork-opensource.org/>`_

 * `Development releases (unstable)  <https://sourceforge.net/projects/geonetwork/files/GeoNetwork_unstable_development_versions//>`_

Source code
-----------

 * `GitHub repository <https://github.com/geonetwork/core-geonetwork>`_

To checkout the current development version and build it, use::

    $ git clone --recursive git://github.com/geonetwork/core-geonetwork.git geonetwork
    $ cd geonetwork
    $ git checkout master
    $ git submodule update --init
    $ mvn clean install
    $ cd web
    $ mvn jetty-run

and open a browser on http://localhost:8080/geonetwork.


For more information, refer to the `developer guide <https://github.com/geonetwork/core-geonetwork/tree/develop/software_development>`_
