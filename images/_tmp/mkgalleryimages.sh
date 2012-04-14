#!/bin/bash
#
# $1 is folder name, $2 is number of images
#

# echo -e "Output folder to make? "
# read NAME
# echo -e "Max image number from input? "
# read MAXIMAGE

INPUTFOLDER=$1
OUTPUTNAME=$2
# MAXIMAGE=$2
# INPUTFOLDER=$2
MAXIMAGE=`ls $INPUTFOLDER/ | wc -l`
let -i MAXIMAGE     # to make it an integer

mkdir $OUTPUTNAME
for (( i=1; i <= $MAXIMAGE; i++ ))
do
    convert $INPUTFOLDER/$i.JPG  -resize 540x1^\> -strip $OUTPUTNAME/$OUTPUTNAME-$i.jpg
    convert -define jpeg:size=100x100 $INPUTFOLDER/$i.JPG  -thumbnail 36x36^\> -gravity center -extent 36x36 $OUTPUTNAME/$OUTPUTNAME-thumb-$i.png
#    convert $INPUTFOLDER/$i.JPG  -resize 540x1^\> -strip $OUTPUTNAME/$OUTPUTNAME-$i.jpg
#    convert $INPUTFOLDER/$i.JPG  -resize 36x36^\> -gravity center -extent 36x36 -strip $OUTPUTNAME/$OUTPUTNAME-thumb-$i.png
done

# Notes:
# Images are usu. exported from iPhoto in sequential
# order into 'input' folder referred to above.
# Running `bash mkgalleryimages <folder-name>` from the command line
# then makes the appropriate folder and thumbnails.
# Simply `mv` the resulting folder into 'images/' so that
# '_includes/amc/make_gallery' can do the rest.