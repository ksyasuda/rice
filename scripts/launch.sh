#!/usr/bin/env bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

# polybar -c ~/i3/configs/config.ini main &
# polybar -c ~/SudacodeRice/polybar/config.ini main &
# polybar -c ~/SudacodeRice/polybar/config.ini main &

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		# MONITOR=$m polybar --reload -c ~/SudacodeRice/polybar/config.desktop.ini main &
		# update to use new theme
		MONITOR=$m polybar --reload -c "$HOME/SudacodeRice/polybar-themes/sblocks/config-4k.ini" main &
	done
else
	polybar --reload example &
fi
