#!/bin/bash
#
# $1 is image name
#

INPUTIMAGE=$1
NAME="${INPUTIMAGE%%.*}"
EXT="${INPUTIMAGE##*.}"

convert $INPUTIMAGE  -resize 540x1^\> -strip ../web/$NAME.$EXT
