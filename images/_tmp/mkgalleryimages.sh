#!/bin/bash
#
# $1 is folder name, $2 is number of images
#

# echo -e "Output folder to make? "
# read NAME
# echo -e "Max image number from input? "
# read MAXIMAGE

NAME=$1
MAXIMAGE=$2

mkdir $NAME
for (( i=1; i <= $MAXIMAGE; i++ ))
do
    convert input/$i.JPG  -resize 940x1^\>  $NAME/$NAME-$i.jpg
    convert input/$i.JPG  -resize 40x40^\> -gravity center -extent 40x40  $NAME/$NAME-thumb-$i.jpg
done