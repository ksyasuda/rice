#!/usr/bin/env bash

ARGS=(
    "workpc - wfs-h1lbc42.hankeyinvestments.com"
    "jumpbox - wfsmsvpjumpbox1"
    "rptbox2 - wfsmsvsrptbox2.westlakefinancial.com"
    "Quit"
)

CHOICE=$(printf "%s\n" "${ARGS[@]}" | rofi -config ~/SudacodeRice/rofi/rofidmenu.rasi -dmenu -l 4 -i -p "RDP Helper")

if [[ "$CHOICE" == "Quit" ]]; then
    echo "BYE" && exit 0
fi

if [ "$CHOICE" ]; then
    TARGET=$(printf "%s\n" "${CHOICE}" | awk '{print $1}')
    printf "%s\n" "TARGET: $TARGET"
    ~/Work/scripts/remote "$TARGET" || exit 1
fi
