#!/usr/bin/env bash

HOSTS=(
    "DEPOT02 - dc1lxsdepot02.westlakefinancial.com"
)

CHOICE=$(printf '%s\n' "${HOSTS[@]}" | rofi -dmenu -i -l 10)

echo $CHOICE


# print hostname
printf "%s\n" "${HOSTS[@]}" | awk '{print $NF}'
