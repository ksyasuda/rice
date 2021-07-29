#!/usr/bin/env bash

set -euo pipefail

function check_player() {
	if ! $(playerctl status >/dev/null 2>&1); then
		printf "\n"
		exit 1
	fi
}

# function that checks if the player is playing
# if not, it will exit
check_player

ICON=''
get_icon() {
	check_player
	STATUS=$(playerctl status)
	if [[ $STATUS == "Playing" ]]; then
		ICON=' '
	elif [[ $STATUS == "Paused" ]]; then
		ICON='契 '
	fi
}

while getopts nptsbf options
do
	case $options in
		n)
			playerctl next
			;;
		p)
			playerctl prev
			;;
		t)
			playerctl play-pause
			;;
		s)
			# get_icon
			# TITLE=$(playerctl metadata title)
			# printf "$ICON $TITLE\n" | cut -b  -55
			# --match-text "Paused:*" "-b '契 '  -s 0" \
			# --match-text "Playing:*" "-b ' ' -s 1" \
			zscroll --delay 0.3 \
				--match-command "get-player-title" \
				--match-text "Paused:" "-s 0" \
				--match-text "Playing:" "-s 1" \
				--update-check true "get-player-title" &
			wait
			;;
		b)
			printf "玲\n"
			;;
		f)
			printf "怜\n"
			;;
		?)
			printf "invalid arg\n"
			exit 1
			;;
	esac
done
