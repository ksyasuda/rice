#!/usr/bin/env bash

## display currently playing/paused song with zscroll
## no output when mpd is stopped

if ! mpc >/dev/null 2>&1; then
	exit 1
else (
	mpc current | zscroll --delay 0.3 \
			--match-command "mpc status" \
			--match-text "playing" "--before-text ' '" \
			--match-text "paused" "--before-text '契 ' --scroll 0" \
			--update-check true "mpc current" &
) &
fi

mpc idle >/dev/null
