#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		# MONITOR=$m polybar --reload -c ~/SudacodeRice/polybar/config.desktop.ini main &
		# update to use new theme
		MONITOR=$m polybar --reload -c "$HOME/SudacodeRice/polybar-themes/sblocks/config.ini" main &
	done
else
	polybar --reload example &
fi

# Launch bar1 and bar2
# polybar -c ~/SudacodeRice/polybar/config.desktop.ini main &
