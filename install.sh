#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

# Create bin folder
mkdir bin

# Generate image-reader binaries
cd image-reader
rm -rf build
mkdir build
cd build
cmake ..
cmake --build .
mv image-reader $SCRIPTPATH/bin
rm -rf $SCRIPTPATH/image-reader/build

cd $SCRIPTPATH

