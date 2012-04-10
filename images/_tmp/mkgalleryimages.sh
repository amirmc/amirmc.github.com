#!/bin/bash
#
# $1 is folder name, $2 is number of images
#

# echo -e "Output folder to make? "
# read NAME
# echo -e "Max image number from input? "
# read MAXIMAGE

NAME=$1
# MAXIMAGE=$2
MAXIMAGE=`ls _input/ | wc -l`
let -i MAXIMAGE     # to make it an integer

mkdir $NAME
for (( i=1; i <= $MAXIMAGE; i++ ))
do
    convert _input/$i.JPG  -resize 940x1^\>  $NAME/$NAME-$i.jpg
    convert _input/$i.JPG  -resize 36x36^\> -gravity center -extent 36x36  $NAME/$NAME-thumb-$i.jpg
done

# Notes:
# Images are usu. exported from iPhoto in sequential
# order into 'input' folder referred to above.
# Running `bash mkgalleryimages <folder-name>` from the command line
# then makes the appropriate folder and thumbnails.
# Simply `mv` the resulting folder into 'images/' so that
# '_includes/amc/make_gallery' can do the rest.