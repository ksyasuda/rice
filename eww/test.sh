#!/usr/bin/env bash

teststr=$(mpc current -f "%file%")
echo "$teststr"
artist=$(echo "$teststr" | awk -F "/" '{print $1}')
album=$(echo "$teststr" | awk -F "/" '{print $2}')

echo "ARTIST: $artist ALBUM: $album"
