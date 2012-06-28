#!/bin/bash

current_dir=$(pwd)

# -------------------------------------------------------
# SVN ---------------------------------------------------
# -------------------------------------------------------

# Download from GitHub master to 'latest' folder
rm -rf latest
git clone https://github.com/geonetwork/core-geonetwork.git latest
cd latest
git checkout master
git submodule update --init
cd ..
#rm -rf `find latest -type d -name .svn`

# Create folder for stable branch and checkout it
rm -rf stable
cp -R latest stable
cd stable
./git-all checkout -b 2.6.x remotes/origin/2.6.x
cd ..
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

