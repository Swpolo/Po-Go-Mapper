#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
ROOTPATH=$SCRIPTPATH/..
cd $ROOTPATH/tmp


# Need a better way to get job id
# could be provided by discord bot instead
timestamp() {
  echo $(($(date +%s%N)/1000000))
}

id=$(timestamp)

$ROOTPATH/bin/image-reader $1 $id
tesseract $id.jpg $id &>/dev/null
sed -i ':a;N;$! ba;s/\n/ /g' ${id}.txt
sed -i 's/ \+/ /g' ${id}.txt
sed -i 's/ *$//g' ${id}.txt
cat ${id}.txt
rm $id.jpg
rm $id.txt