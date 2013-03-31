#!/bin/bash
#
# $1 is folder with pics to process
# $2 is name of gallery to output
#

INPUTFOLDER=$1
OUTPUTNAME=$2

mkdir $OUTPUTNAME
cd $INPUTFOLDER
for file in *
do
    convert $file  -resize 540x1^\> -strip ../$OUTPUTNAME/$OUTPUTNAME-"${file%.*}".jpg
    convert -define jpeg:size=100x100 $file  -thumbnail 36x36^\> -gravity center -extent 36x36 ../$OUTPUTNAME/$OUTPUTNAME-thumb-"${file%.*}".png
    #echo "$INPUTFOLDER"/"$file" -> "$OUTPUTNAME"
done

# Notes:
# Images are usu. exported from iPhoto in sequential
# order into 'input' folder referred to above.
# Running `bash mkgalleryimages <folder-name>` from the command line
# then makes the appropriate folder and thumbnails.
# Simply `mv` the resulting folder into 'images/' so that
# '_includes/amc/make_gallery' can do the rest.