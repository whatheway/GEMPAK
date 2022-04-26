#!/bin/bash



################# Creating folders for GEMPAK ##################################

export HOME=`cd;pwd`
mkdir $HOME/GEMPAK
mkdir $HOME/GEMPAK/Downloads


####################### Basic Package Management for GEMPAK #####################

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install make autoconf automake libtool gcc build-essential gfortran libx11-dev libxt-dev libxext-dev libmotif-dev libxft-dev libxtst-dev xorg xbitmaps flex byacc locate libmotif-common libmotif-dev xfonts-100dpi xfonts-75dpi xfonts-cyrillic libxpm4 libxpm-dev

################### Download GEMPAK tarball and untar into GEMPAK folder #####################
wget https://github.com/Unidata/gempak/archive/refs/tags/7.14.0.1.tar.gz
tar -xvzf gempak-7.14.0.1.tar.gz -C $HOME/GEMPAK

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
make all >& make.out & tail -f make.out    # Invoking Make to compile GEMPAK7.14.0.1 w/ tail output.
make programs_nc
make programs_gf

Make install


















