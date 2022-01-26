#!/usr/bin/env bash

BASE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/picom"
HIGH_TRANSPARENCY=picom-hightransparency.conf
NO_TRANSPARENCY=picom-notransparency.conf

ARGS=(
	"1. High Transparency"
	"2. No Transparency"
	"3. No Picom"
	"4. Quit"
)

CHOICE=$(printf "%s\n" "${ARGS[@]}" | rofi -config ~/.config/rofi/config.rasi -dmenu -l 5 -i -p "Picom Options")
SELECTION=$(awk '{print $1}' <<< "$CHOICE")
conf=""
case "$SELECTION" in
	1.)
		conf="$BASE_DIR/$HIGH_TRANSPARENCY"
		;;
	2.)
		conf="$BASE_DIR/$NO_TRANSPARENCY"
		;;
	3.)
		killall -q picom
		exit $?
		;;
	4.)
		exit 0
		;;
	*)
		exit 1
		;;
esac

[ -z "$conf" ] && conf="$BASE_DIR/picom.conf"

if pgrep 'picom' > /dev/null; then
	killall -q picom && sleep 0.1 # allow time to kill old process
fi

picom --config="$conf" > /dev/null 2>&1 &
