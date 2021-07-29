#!/bin/bash

set -Eeuo pipefail

dir="/usr/share/wallpapers/"
EXT="/contents/images/1920x1080.jpg"
EXT2="/contents/images/"
count=0
# choose a random directory in wallpapers folder
chosen=$(ls /usr/share/wallpapers | shuf -n 1)
# check to make sure it is a directory
if [[ -d $dir$chosen ]]; then
	if [[ -f "$dir$chosen$EXT" ]]; then
		feh --bg-scale $dir$chosen$EXT
		file=$chosen
	else
		file=$(ls $dir$chosen$EXT2 | shuf -n 1)
		feh --bg-scale $dir$chosen$EXT2$file 
	fi
	echo $file
else
	echo 'something went wrong'
fi
