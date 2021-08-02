#!/bin/bash

#Basic Package Management for GEMPAK

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install make autoconf automake libtool gcc build-essential gfortran libx11-dev libxt-dev libxext-dev libmotif-dev libxft-dev libxtst-dev xorg xbitmaps flex byacc



#Downloading old packages for GEMPAK that are no longer in apt library
#Libfortran 3.6.5.0
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-6/libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb
#GCC-6
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-6/gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb
#Libmotif3
wget http://archive.ubuntu.com/ubuntu/pool/universe/m/motif/libmotif-dev_2.3.8-2build1_amd64.deb
#multiarch-support
wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1_amd64.deb

#Libxp6
wget ftp.us.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb
#x11proto-print-dev
wget http://archive.ubuntu.com/ubuntu/pool/universe/x/x11proto-print/x11proto-print-dev_1.0.5-2_all.deb
#Libxp-dev
wget http://debian.mirror.garr.it/debian/pool/main/libx/libxp/libxp-dev_1.0.2-2_amd64.deb

sudo dpkg -i gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb
sudo dpkg -i libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb 
sudo dpkg -i multiarch-support_2.27-3ubuntu1_amd64.deb
sudo dpkg -i libxp6_1.0.2-2_amd64.deb
sudo dpkg -i x11proto-print-dev_1.0.5-2_all.deb
sudo dpkg -i libmotif-dev_2.3.8-2build1_amd64.deb
sudo dpkg -i libxp-dev_1.0.2-2_amd64.deb

