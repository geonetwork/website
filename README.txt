Website build
=============

In order to build website, checkout the website source::

  svn co https://geonetwork.svn.sourceforge.net/svnroot/geonetwork/website


Run the following command to install required module (optional only required to build JS docs):

  python setup_website
  . bin/activate 


Build GeoNetwork user manual
----------------------------

Retrieve user and developer docs using shell script or paver:

  ./checkup_docs.sh
or
  paver checkup_docs

Run make html in docsrc to build website using sphinx:

  make html

Copy the javadoc to the build/html folder:
  
  cp -fr ../../trunk/docs/build/html/javadoc build/html/.

Publish the website on geonetwork-opensource.org


Build JS documentation (experimental)
-----------------------------------------

Run paver in order to extract rst documentation from JS source files:
  paver parse_docs


