#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH
sudo docker stop pogomapper-db &>/dev/null
sudo docker run -it --rm \
--net host \
--name pogomapper-db \
-e MYSQL_ROOT_PASSWORD=password \
-e MYSQL_INITDB_SKIP_TZINFO=1 \
-v $SCRIPTPATH/datadir:/var/lib/mysql \
pogomapper-db