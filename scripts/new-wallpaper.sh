#!/usr/bin/env bash

set -Eeuo pipefail

DIR=/home/sudacode/Pictures/wallpapers/
feh --bg-scale "$(find "$DIR" | shuf -n 1)"
