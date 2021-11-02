#!/usr/bin/env bash

CMD=$(ssh)

ARGS=(
    "Depot - root@dc1lxpdepot01.westlakefinancial.com"
    "Depot02 - kyasuda@dc1lxsdepot02.westlakefinancial.com"
    "Jobrunner01 - root@dc1vpjobrunner01.westlakefinancial.com"
    "Jobrunner02 - root@mdr-s-jobrunner02.westlakefinancial.com"
    "Jobrunner03 - kyasuda@dc1vsjobrunner03.westlakefinancial.com"
    "Quit"
)

CHOICE=$(
    printf "%s\n" "${ARGS[@]}" | rofi -config ~/SudacodeRice/rofi/flat-orange.rasi -dmenu -l 5 -i -p "SSH Helper"
)

if [[ "$CHOICE" == "Quit" ]]; then
    printf "%s\n" "NICE" && exit 1
fi

if [ "$CHOICE" ]; then
    TARGET=$(printf "%s\n" "${CHOICE}" | awk '{print $1}')
    INFO=$(printf "%s\n" "${CHOICE}" | awk '{print $NF}')
    echo "TARGET $TARGET"
    python ~/Work/scripts/pass.py "$TARGET"
    alacritty -e ssh "$INFO"
else
    printf "%s\n" "DONE." && exit 0
fi
