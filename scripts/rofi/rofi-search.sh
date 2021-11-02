#!/usr/bin/env bash

export GOOGLE_ARGS='["--count", 7]'
export ROFI_SEARCH='googler'
rofi -modi blocks -blocks-wrap /usr/bin/rofi-search -show blocks -lines 7 -eh 4 -kb-custom-1 'Control+y' -theme ~/SudacodeRice/rofi/rofidmenu.rasi &
