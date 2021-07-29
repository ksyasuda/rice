#!/usr/bin/env bash

set -euo pipefail

# check to see if there is anything playing
# if not program exits I think

# Check to make sure that a player is running
player=$(playerctl status 2>/dev/null)
if [[ $player == "No players found" ]]; then
	player=''
	exit 1
fi

# check to make sure Spotify is running
check=$(playerctl metadata | grep spotify)
if [[ $check == '' ]]; then
	exit 1
fi

if [[ $# -ne 1 ]]; then
	echo 'You must append either the "prev" or "append" argument'
	exit 1
fi

# argument, which decides which icon to print
arg=$1
if [[ $arg == 'prev' ]]; then
	echo "玲"
elif [[ $arg == 'next' ]]; then
	echo "怜"
fi
