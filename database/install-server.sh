#!/bin/bash
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
sudo docker stop pogomapper-db
sudo rm -rf datadir
mkdir datadir
sudo docker build -t pogomapper-db .