#!/bin/bash



################# Creating folders for GEMPAK ##################################

export HOME=`cd;pwd`
mkdir $HOME/GEMPAK
mkdir $HOME/GEMPAK/Downloads


####################### Basic Package Management for GEMPAK #####################

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install make autoconf automake libtool gcc build-essential gfortran libx11-dev libxt-dev libxext-dev libmotif-dev libxft-dev libxtst-dev xorg xbitmaps flex byacc locate



#Downloading old packages for GEMPAK that are no longer in Apt library
cd $HOME/GEMAPK/Downloads

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


# Insatlling old packages for GEMPAK that are not in Apt library
echo "Installing GC6 BASE"
sudo dpkg -i gcc-6-base_6.5.0-2ubuntu1~18.04_amd64.deb
echo "Installing GFORTRAN 3.6.5.0"
sudo dpkg -i libgfortran3_6.5.0-2ubuntu1~18.04_amd64.deb 
echo "Installing MULTIARCH-SUPPORT"
sudo dpkg -i multiarch-support_2.27-3ubuntu1_amd64.deb
echo "Installing LIBXP6"
sudo dpkg -i libxp6_1.0.2-2_amd64.deb
echo "Installing X11PROTO-PRINT-DEV"
sudo dpkg -i x11proto-print-dev_1.0.5-2_all.deb
echo "Installing LIBMOTIF-DEV"
sudo dpkg -i libmotif-dev_2.3.8-2build1_amd64.deb
echo "Installing LIBXP-DEV"
sudo dpkg -i libxp-dev_1.0.2-2_amd64.deb

################### Download GEMPAK tarball and untar into GEMPAK folder #####################

wget -c https://www.unidata.ucar.edu/downloads/gempak/nawips-7.5.1/gempak-7.5.1.tar.gz
tar -xvzf gempak-7.5.1.tar.gz -C $HOME/GEMPAK

################### Creating symbolic link to GEMPAK7 to NAWIPS ##############################


cd $HOME/GEMPAK
ln -s GEMPAK7/ NAWIPS



###################### Edit Gemenviron & Gemenviron.profile #################################
#Using uncommon delimiters for sed


cd $HOME/GEMPAK/GEMPAK7
sed -i "s|setenv NAWIPS /home/gempak/GEMPAK7|setenv NAWIPS $HOME/GEMPAK/GEMPAK7|" Gemenviron
sed -i "s|NAWIPS=/home/gempak/GEMPAK7|NAWIPS=$HOME/GEMPAK/GEMPAK7|" Gemenviron.profile


####################### Sourcing Environmental Variables ###########################
# Adding path of GEMPAK to /.bashrc $ /.profile
#This will be done with the cat command
#In terminal enter cat --help to understand options


cd $HOME
cat >> .bashrc <<'EOF'
. /$HOME/GEMPAK/NAWIPS/Gemenviron.profile
EOF
source .bashrc                                #sourcing .bashrc to enable path.

cat >> .profile <<'EOF'
. /$HOME/GEMPAK/NAWIPS/Gemenviron.profile
EOF
source .porfile                              #sourcing .profile to enable path.


##################################### Installing GEMPAK 7.5.1 #################################
# 

cd $HOME/GEMPAK/NAWIPS
make all >& make.out & tail -f make.out    # Invoking Make to compile GEMPAK7.5.1 w/ tail output.



















