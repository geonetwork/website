#!/bin/bash

current_dir=$(pwd)

# -------------------------------------------------------
# SVN ---------------------------------------------------
# -------------------------------------------------------

# Download from SVN trunk to 'latest' folder
svn co https://geonetwork.svn.sourceforge.net/svnroot/geonetwork/trunk latest
#rm -rf `find latest -type d -name .svn`
# Download from SVN stable tag to 'stable' folder
rm -rf stable
svn co https://geonetwork.svn.sourceforge.net/svnroot/geonetwork/tags/2.6.4 stable
#rm -rf `find stable -type d -name .svn`

# -------------------------------------------------------
# Trunk documentation -----------------------------------
# -------------------------------------------------------

# Build javadoc for trunk
cd latest/web
#mvn install
mvn javadoc:javadoc

cd ../jeeves
#mvn install
mvn javadoc:javadoc

# Build website docs for trunk
cd ../docs
mvn install

# -------------------------------------------------------
# Stable documentation ----------------------------------
# -------------------------------------------------------

# Build javadoc for stable tag
cd $current_dir/stable/web
#mvn install
mvn javadoc:javadoc

cd ../jeeves
#mvn install
mvn javadoc:javadoc

# Build website docs for stable tag
cd ../docs
mvn install


# -------------------------------------------------------
# geonetwork-opensource website -------------------------
# -------------------------------------------------------

# Build geonetwork-opensource website
# -------------------------------------------------------
cd $current_dir/docsrc
make clean
make html

# Copy GeoNetwork docs to website folder (trunk)
# -------------------------------------------------------
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/geonetwork
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/jeeves
mkdir $current_dir/docsrc/build/html/manuals/trunk/eng/users

mkdir $current_dir/docsrc/build/html/manuals/trunk/eng/widgets
mkdir $current_dir/docsrc/build/html/manuals/trunk/fra
mkdir $current_dir/docsrc/build/html/manuals/trunk/fra/users

# ... Users
cd $current_dir/latest/docs/eng/users/build
cp -R html/* $current_dir/docsrc/build/html/manuals/trunk/eng/users
cp -R latex/GeoNetworkUserManual.pdf $current_dir/docsrc/build/html/manuals/trunk/eng/users
cd $current_dir/latest/docs/fra/users/build
cp -R html/* $current_dir/docsrc/build/html/manuals/trunk/fra/users

# ... Developer
cd $current_dir/latest/docs/eng/developer/build
cp -R html/* $current_dir/docsrc/build/html/manuals/trunk/eng/developer
cp -R latex/GeoNetworkDeveloperManual.pdf $current_dir/docsrc/build/html/manuals/trunk/eng/developer

# ... Widgets
cd $current_dir/latest/docs/widgets/build
cp -R html/* $current_dir/docsrc/build/html/manuals/trunk/eng/widgets

#javadoc
cd $current_dir/latest/web/target/site
cp -R apidocs/* $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/geonetwork

cd $current_dir/latest/jeeves/target/site
cp -R apidocs/* $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/jeeves

# Copy docs to website folder (stable)
# -------------------------------------------------------
mkdir -p $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer/apidocs/geonetwork
mkdir -p $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer/apidocs/jeeves
mkdir $current_dir/docsrc/build/html/manuals/2.6.4/eng/users

# ... Users
cd $current_dir/stable/docs/eng/users/build
cp -R html/* $current_dir/docsrc/build/html/manuals/2.6.4/eng/users
cp -R latex/GeoNetworkUserManual.pdf $current_dir/docsrc/build/html/manuals/2.6.4/eng/users

# ... Developer
cd $current_dir/stable/docs/eng/developer/build
cp -R html/* $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer
cp -R latex/GeoNetworkDeveloperManual.pdf $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer

#javadoc
cd $current_dir/stable/web/target/site
cp -R apidocs/* $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer/apidocs/geonetwork
cd $current_dir/stable/jeeves/target/site
cp -R apidocs/* $current_dir/docsrc/build/html/manuals/2.6.4/eng/developer/apidocs/jeeves

