#!/bin/bash
timestamp() {
  date +"%T"
}

id=$(timestamp)

./bin/image-reader $1 $id
tesseract $id.jpg $id &>/dev/null
sed -i ':a;N;$! ba;s/\n/ /g' ${id}.txt
sed -i 's/ \+/ /g' ${id}.txt
sed -i 's/ *$//g' ${id}.txt
cat ${id}.txt
rm $id.jpg
rm $id.txt