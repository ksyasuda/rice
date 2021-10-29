#!/usr/bin/env bash

ARGS=(
    "Enable Picom"
    "Disable Picom"
)

CHOICE=$(printf "%s\n" "${ARGS[@]}" | rofi -config ~/SudacodeRice/rofi/rofidmenu.rasi -dmenu -l 5 -i -p "Picom Options")

# printf '%s\n' {$CHOICE} | awk '{print $NF}'

echo "$CHOICE"

if [[ "$CHOICE" == "Enable Picom" ]]; then
    ~/SudacodeRice/scripts/picom.sh
elif [[ "$CHOICE" == "Disable Picom" ]]; then
    ~/SudacodeRice/scripts/picom.sh -k
fi
