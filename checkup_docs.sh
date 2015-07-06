#!/bin/bash

export MAVEN_OPTS="-Xmx512M -XX:MaxPermSize=256M"

current_dir=$(pwd)

tag210='2.10.4'

echo "=======> Website creation started"

# -------------------------------------------------------
# GIT ---------------------------------------------------
# -------------------------------------------------------

# Download from GitHub master to 'latest' folder"
echo "=======> Download from GitHub develop branch to 'latest' folder"

rm -rf latest
git clone git://github.com/geonetwork/core-geonetwork.git latest

cd $current_dir/latest
git checkout -b develop --track origin/develop
git submodule update --init

# Create folder for 2.10.x branch to '210x' folder
echo "=======> Create folder for 2.10.x branch"

cd $current_dir
rm -rf 210x
cp -R latest 210x
cd $current_dir/210x
git fetch --tags
git checkout tags/$tag210
git submodule update --init
git clean -fxd

# Download from GitHub docs to 'doc' folder
echo "=======> Download from GitHub docs to 'doc' folder"
cd $current_dir
rm -rf doc
git clone https://github.com/geonetwork/doc.git



# -------------------------------------------------------
# Develop branch documentation ---------------------------
# -------------------------------------------------------

#echo "=======> Build develop branch javadocs"
# Build javadoc for trunk
#cd latest
#mvn clean site

echo "=======> Build develop branch manuals"
pwd
cd $current_dir/doc
mvn clean install


# -------------------------------------------------------
# 2.10.x documentation ----------------------------------
# -------------------------------------------------------

echo "=======> Build 2.10.x branch manuals"
# Build website docs for 2.10.x tag
cd $current_dir/210x/docs
mvn install


# -------------------------------------------------------
# geonetwork-opensource website -------------------------
# -------------------------------------------------------

# Build geonetwork-opensource website
# -------------------------------------------------------
echo "=======> Build website"

cd $current_dir/docsrc
make clean
make html

# Copy GeoNetwork manuals to website folder (trunk)
# -------------------------------------------------------
echo "=======> Copy GeoNetwork trunk docs to website folder"
#mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/geonetwork
#mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/developer/apidocs/jeeves
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/fra/users

# ... Users
cd $current_dir/doc/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/eng/users
cd $current_dir/doc/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/fra/users


# Copy docs to website folder (2.10.x)
# -------------------------------------------------------
echo "=======> Copy GeoNetwork 2.10.x docs to website folder"
mkdir -p $current_dir/docsrc/build/html/manuals/$tag210/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$tag210/eng/developer

# ... Users
cd $current_dir/210x/docs/eng/users/build
cp -R html/* $current_dir/docsrc/build/html/manuals/$tag210/eng/users
cp -R latex/GeoNetworkUserManual.pdf $current_dir/docsrc/build/html/manuals/$tag210/eng/users

# ... Developer
cd $current_dir/210x/docs/eng/developer/build
cp -R html/* $current_dir/docsrc/build/html/manuals/$tag210/eng/developer
cp -R latex/GeoNetworkDeveloperManual.pdf $current_dir/docsrc/build/html/manuals/$tag210/eng/developer

echo "=======> Website creation finished"
