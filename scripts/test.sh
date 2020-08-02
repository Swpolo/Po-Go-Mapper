#!/bin/bash 
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

echo "Expect Saint Lawrence"
./read.sh https://cdn.discordapp.com/attachments/504820811518181387/739218449980588082/116130892_299769734472275_940260079216275046_n.jpg
echo " "
sleep 1

echo "Expect Mural - Jazz singer"
./read.sh https://cdn.discordapp.com/attachments/570704846530019329/735613996442320936/110626583_590698988303091_776081355083533649_n.jpg
echo " "
sleep 1

echo "Expect Le Village Imaginé"
./read.sh https://cdn.discordapp.com/attachments/707376623279669257/721087817320628306/Screenshot_20200612-154424_Pokmon_GO.jpg
echo " "
sleep 1

echo "Expect Patinoire bleu blanc"
./read.sh https://cdn.discordapp.com/attachments/455794295698620429/739257340913778728/117128168_318245162557478_4867715876385762020_n.jpg
echo " "
sleep 1

echo "Expect Peinture jeux d'eau"
./read.sh https://cdn.discordapp.com/attachments/612817187941515294/738168851707199588/116336929_285071929253150_854585407804318570_n.jpg
echo " "
