#!/usr/bin/env bash

set -euo pipefail

checkRunning="$(mpc current)"
if [[ $checkRunning == '' ]]; then
	exit 1
fi

arg=$1
if [[ $arg == 'next' ]]; then
	echo "怜"
elif [[ $arg == 'prev' ]]; then
	echo "玲"
fi
