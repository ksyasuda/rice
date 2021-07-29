#!/bin/bash

for file in $(ls); do
	filename=$(filename $file)
	extension=$(extension $file)
	if [[ $filename != "move" && $filename != $extension ]]; then
		echo $filename.$extension
		ln -sr $file /home/sudacode/.config/polybar/scripts/$file
	elif [[ $filename == $extension ]]; then
		echo $filename
		ln -sr $filename /home/sudacode/.config/polybar/scripts/$filename
	fi
done
