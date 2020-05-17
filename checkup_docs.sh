#!/bin/bash

export MAVEN_OPTS="-Xmx512M -XX:MaxPermSize=256M"
MAVEN_PROFILES=$1

if [ "$1" == "--help" ]; then
  echo "Usage: ./checkup_docs only for basic english version"
  echo "Usage: ./checkup_docs -Pall for all languages using cached translations"
  echo "Usage: ./checkup_docs -Platest,all for all languages using latest translations on transifex"
  exit 0;
fi

current_dir=$(pwd)

tag210='2.10.4'
tagold='3.8.x'
branchold='3.8.x'
current='3.10.x'

echo "=> WEBSITE CREATION STARTED"

# -------------------------------------------------------
# GIT ---------------------------------------------------
# -------------------------------------------------------

# Download from GitHub master to 'latest' folder"
echo "=======> Downloading from GitHub master branch to 'latest' folder"

if [ ! -e "latest" ]; then 
  git clone git://github.com/geonetwork/core-geonetwork.git latest;
else 
  cd $current_dir/latest;   
  git pull 
fi

cd $current_dir/latest
if git show-ref --quiet refs/heads/master; then   
  git checkout master
  git pull
else
  git checkout --track master
fi
git submodule update --init

# -------------------------------------------------------
# 2.10.4 branch documentation ---------------------------
# -------------------------------------------------------

# Create folder for 2.10.x branch to '210x' folder
echo "=======> Create folder for 2.10.x branch (tag "$tag210")"
cd $current_dir
if [ ! -e "210x" ]; then 
  cp -R latest 210x
fi
cd $current_dir/210x 
echo "==========> Cleanup repository"
git fetch --tags
echo "==========> Checkout tag "$tag210
git checkout tags/$tag210
git submodule update --init

echo "=========> Build "$tag210" branch manuals"
# Build website docs for 2.10.x tag
cd docs
mvn -q clean install -DskipTests
echo "=========> "$tag210"  manuals created"

# -------------------------------------------------------
# 3.x.y branch documentation ---------------------------
# -------------------------------------------------------

# Download from GitHub docs to 'doc' folder
echo "=======> Create folder for old stable 3.x.y branch (tag "$tagold")"
cd $current_dir
if [ ! -e "doc"$tagold ]; then 
  git clone https://github.com/geonetwork/doc.git doc$tagold; 
else 
  echo "==========> Cleanup repository"
  cd $current_dir/doc$tagold;   
fi

echo "=======> Build "$tagold" branch manuals"
cd $current_dir/doc$tagold
echo "==========> Checkout branch "$branchold
git fetch --tags
if git show-ref --quiet refs/heads/$branchold; then   
  git checkout $branchold
  git pull
else
  git checkout --track $branchold
fi
git submodule update --init
echo "=======> Build "$tagold" manuals"
mvn -q clean install $MAVEN_PROFILES
echo "=======> "$branchold" manual created"
cd ..


# Download from GitHub docs to 'doc' folder
echo "=======> Create folder for old stable 3.x.y branch (tag "$current")"
cd $current_dir
if [ ! -e "doc"$current ]; then 
  git clone https://github.com/geonetwork/doc.git doc$current; 
  echo "==========> Checkout tag "$current
  cd doc$current
  git checkout --track $current
else 
  cd $current_dir/doc$current;     
  echo "==========> Checkout tag "$current
  if git show-ref --quiet refs/heads/$current; then   
    git checkout $current
  else
    git checkout --track $current
  fi
  git pull
fi

echo "=======> Build "$current" branch manuals"
git submodule update --init
echo "=======> Build "$current" manuals"
mvn -q clean install -DskipTests $MAVEN_PROFILES
echo "=======> "$current" manuals created"
cd ..


# -------------------------------------------------------
# Develop branch documentation ---------------------------
# -------------------------------------------------------


# Download from GitHub docs to 'doc' folder
echo "==========> Create folder for stable 3.x.y branch (latest)"
cd $current_dir
if [ ! -e "doc" ]; then 
  git clone https://github.com/geonetwork/doc.git doc; 
else 
  cd $current_dir/doc;   
  git pull
fi

echo "=======> Build develop branch manuals"
cd $current_dir/doc
echo "=======> Build latest manuals"
mvn -q clean install -DskipTests $MAVEN_PROFILES
echo "=======> latest manuals created"



# Build geonetwork-opensource website
# -------------------------------------------------------
echo "=> Build website"

cd $current_dir/docsrc
make clean
make html

# Copy GeoNetwork manuals to website folder (trunk)
# -------------------------------------------------------
echo "=======> Copy GeoNetwork 3.x.y docs to website folder"
mkdir -p $current_dir/docsrc/build/html/manuals/$tagold/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$tagold/fra/users

mkdir -p $current_dir/docsrc/build/html/manuals/$current/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/$current/fra/users

mkdir -p $current_dir/docsrc/build/html/manuals/trunk/eng/users
mkdir -p $current_dir/docsrc/build/html/manuals/trunk/fra/users

# ... Users
cd $current_dir/doc$tagold/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/$tagold/eng/users
cd $current_dir/doc$tagold/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/$tagold/fra/users

cd $current_dir/doc$current/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/$current/eng/users
cd $current_dir/doc$current/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/$current/fra/users

cd $current_dir/doc/target/doc/en/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/eng/users
cd $current_dir/doc/target/doc/fr/
cp -R * $current_dir/docsrc/build/html/manuals/trunk/fra/users

#Copy i18n manuals
cp -R $current_dir/doc$tagold/target/doc/* $current_dir/docsrc/build/html/manuals/$tagold/
cp -R $current_dir/doc$current/target/doc/* $current_dir/docsrc/build/html/manuals/$current/
cp -R $current_dir/doc/target/doc/* $current_dir/docsrc/build/html/manuals/trunk/


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
