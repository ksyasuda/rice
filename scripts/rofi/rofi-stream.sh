#!/usr/bin/env bash

PLAYER="mpv"

ARGS=(
    "lofi-hip-hop-radio - https://www.youtube.com/watch?v=5qap5aO4i9A"
    "QUIT"
)

CHOICE=$(
    printf "%s\n" "${ARGS[@]}" | rofi -config ~/SudacodeRice/rofi/flat-orange.rasi -dmenu -l 5 -i -p "Choose Stream"
)

if [[ "$CHOICE" == "Quit" ]]; then
    printf "%s\n" "Bye." && exit 1 || exit 1
elif [[ "$CHOICE" ]]; then
    TARGET=$(printf "%s\n" "${CHOICE}" | awk '{print $NF}')
    printf "%s\n" "TARGET: $TARGET"
    $PLAYER $TARGET
    # "$PLAYER $TARGET" &>/dev/null &
else
    printf "%s\n" "Should not get here"
fi
