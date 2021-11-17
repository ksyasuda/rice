#!/usr/bin/env bash
# find "$HOME/Pictures/wallpapers" -type f | shuf -n 1
feh --bg-scale "$(find "$HOME/Pictures/wallpapers" -type f | shuf -n 1)"
