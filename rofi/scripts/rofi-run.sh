#!/usr/bin/env bash

set -Eeuo pipefail

# Script to run a bash command from a rofi prompt

THEME_STR="
window {
    width: 35%;
    height: 10%;
    anchor: north;
    location: north;
}"

# generates a span mesg for rofi given
# input: message: str
generate_span() {
	msg1="$1"
	msg2="$2"
	span="<span foreground='#ecbe7b' style='normal' size='small'>$msg1</span>"
	span2="<span foreground='dodgerblue' style='italic' size='small'>$msg2</span>"
	printf "%s: %s\n" "$span" "$span2"
}

# Get the command to run
cmd="$(rofi -dmenu -l 0 -p 'Run:' -theme-str "$THEME_STR")"

# Check if command is sudo
if [[ "$cmd" == "sudo"* ]]; then
	# Prompt for confirmation
	confirm="$(rofi -dmenu -l 0 -p 'Confirm (Y/N)' \
		-theme-str "$THEME_STR" -mesg "$(generate_span "CMD" "$cmd")" || true)"
	# If not confirmed, exit
	if ! [[ "$confirm" == "Y" || "$confirm" == "y" ]]; then
		exit 0
	fi
fi

if [[ "$#" -gt 0 ]] && [[ "$1" == "-v" || "$1" == "--verbose" ]]; then
	# Send command to dunstify
	dunstify "Running command: $cmd"
fi

# Run the command
eval "$cmd"
