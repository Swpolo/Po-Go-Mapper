#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
ROOTPATH=$SCRIPTPATH/..
cd $ROOTPATH

# Create folders
rm -rf bin
mkdir bin

rm -rf tmp
mkdir tmp

# Generate image-reader binaries
cd image-reader
rm -rf build
mkdir build
cd build
cmake ..
cmake --build .
mv image-reader $ROOTPATH/bin
rm -rf $ROOTPATH/image-reader/build

# Generate database docker image
cd $ROOTPATH/database
./install-server.sh

