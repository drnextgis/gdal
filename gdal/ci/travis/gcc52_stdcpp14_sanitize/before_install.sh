#!/bin/sh

set -e

sudo mv /etc/apt/sources.list.d/pgdg* /tmp
#sudo apt-get remove postgis libpq5 libpq-dev postgresql-9.1-postgis postgresql-9.1-postgis-2.2-scripts postgresql-9.2-postgis postgresql-9.3-postgis postgresql-9.1 postgresql-9.2 postgresql-9.3 libgdal1
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
#sudo add-apt-repository -y ppa:marlam/gta
sudo apt-get update -qq
# postgis postgresql-9.1 postgresql-client-9.1 postgresql-9.1-postgis-2.1 postgresql-9.1-postgis-2.1-scripts
# libproj-dev libfreexl-dev 
sudo apt-get install python-numpy libpq-dev libpng12-dev libjpeg-dev libgif-dev liblzma-dev libgeos-dev libcurl4-gnutls-dev  libxml2-dev libexpat-dev libxerces-c-dev libnetcdf-dev netcdf-bin libpoppler-dev libspatialite-dev gpsbabel swig libhdf4-alt-dev libhdf5-serial-dev libpodofo-dev poppler-utils unixodbc-dev libwebp-dev openjdk-7-jdk libepsilon-dev liblcms2-2 libpcre3-dev mercurial cmake libcrypto++-dev
# libgta-dev
sudo apt-get install python-lxml
sudo apt-get install python-pip
#sudo apt-get install libogdi3.2-dev
# Boost for Mongo
#sudo apt-get install libboost-regex-dev libboost-system-dev libboost-thread-dev
#psql -c "drop database if exists autotest" -U postgres
#psql -c "create database autotest" -U postgres
#psql -c "create extension postgis" -d autotest -U postgres
mysql -e "create database autotest;"
mysql -e "GRANT ALL ON autotest.* TO 'root'@'localhost';" -u root
mysql -e "GRANT ALL ON autotest.* TO 'travis'@'localhost';" -u root
#wget http://s3.amazonaws.com/etc-data.koordinates.com/gdal-travisci/FileGDB_API_1_2-64.tar.gz
#wget http://s3.amazonaws.com/etc-data.koordinates.com/gdal-travisci/MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44.tar.gz
wget http://s3.amazonaws.com/etc-data.koordinates.com/gdal-travisci/install-libecwj2-ubuntu12.04-64bit.tar.gz
#wget http://s3.amazonaws.com/etc-data.koordinates.com/gdal-travisci/install-libkml-r864-64bit.tar.gz
wget https://github.com/uclouvain/openjpeg/releases/download/v2.3.0/openjpeg-v2.3.0-linux-x86_64.tar.gz
#wget http://even.rouault.free.fr/mongo-cxx-1.0.2-install-ubuntu12.04-64bit.tar.gz
wget http://even.rouault.free.fr/install-gcc-5.2.0.tar.bz2
#tar xzf MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44.tar.gz
#sudo cp -r MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44/Raster_DSDK/include/* /usr/local/include
#sudo cp -r MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44/Raster_DSDK/lib/* /usr/local/lib
#sudo cp -r MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44/Lidar_DSDK/include/* /usr/local/include
#sudo cp -r MrSID_DSDK-8.5.0.3422-linux.x86-64.gcc44/Lidar_DSDK/lib/* /usr/local/lib
#tar xzf FileGDB_API_1_2-64.tar.gz
#sudo cp -r FileGDB_API/include/* /usr/local/include
#sudo cp -r FileGDB_API/lib/* /usr/local/lib
tar xzf install-libecwj2-ubuntu12.04-64bit.tar.gz
sudo cp -r install-libecwj2/include/* /usr/local/include
sudo cp -r install-libecwj2/lib/* /usr/local/lib
#tar xzf install-libkml-r864-64bit.tar.gz
#sudo cp -r install-libkml/include/* /usr/local/include
#sudo cp -r install-libkml/lib/* /usr/local/lib
tar xzf openjpeg-v2.3.0-linux-x86_64.tar.gz
sudo cp -r openjpeg-v2.3.0-linux-x86_64/include/* /usr/local/include
sudo cp -r openjpeg-v2.3.0-linux-x86_64/lib/* /usr/local/lib
#tar xzf mongo-cxx-1.0.2-install-ubuntu12.04-64bit.tar.gz
#sudo cp -r mongo-cxx-1.0.2-install/include/* /usr/local/include
#sudo cp -r mongo-cxx-1.0.2-install/lib/* /usr/local/lib
#wget https://bitbucket.org/chchrsc/kealib/get/c6d36f3db5e4.zip
#unzip c6d36f3db5e4.zip
#cd chchrsc-kealib-c6d36f3db5e4/trunk
#cmake . -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DHDF5_INCLUDE_DIR=/usr/include -DHDF5_LIB_PATH=/usr/lib -DLIBKEA_WITH_GDAL=OFF
#make -j4
#sudo make install
#cd ../..
tar xjf install-gcc-5.2.0.tar.bz2
export PATH=$PWD/install-gcc-5.2.0/bin:$PATH
export LD_LIBRARY_PATH=$PWD/install-gcc-5.2.0/lib64
export PRELOAD=$PWD/install-gcc-5.2.0/lib64/libasan.so.2.0.0:$PWD/install-gcc-5.2.0/lib64/libubsan.so.0.0.0
#export PRELOAD=$PWD/install-gcc-5.2.0/lib64/libubsan.so.0.0.0
export ASAN_OPTIONS=allocator_may_return_null=1 
sudo ldconfig
