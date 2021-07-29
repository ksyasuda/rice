#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
	printf 'Must be run with a single argument'
	printf 'either p (Play Pause), n (Next Song), b (back)'
	exit 1
fi

arg=$1
if [[ $arg == '-p' ]]; then
	qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.PlayPause
elif [[ $arg == '-n' ]]; then
	qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.Next
elif [[ $arg == '-b' ]]; then
	qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.Previous
fi
