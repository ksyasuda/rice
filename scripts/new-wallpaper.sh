#!/bin/sh

# set -Eeuo pipefail

DIR=/home/sudacode/Pictures/wallpapers/

img=$(ls $DIR | shuf -n 1)

if [[ $# -gt 0 && $1 == "-v" ]]; then
	echo $img
fi

feh --bg-scale $DIR$img
