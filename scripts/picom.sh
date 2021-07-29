#!/bin/bash

# script to launch a new instance of picom in the background

set -Euo pipefail
# set -Eeuo pipefail
# remove the e argument so that it does not stop on any command failure
# e.g. having no picom running and having line 15 return non 0 return code

verbose=0
justKillIt=0
# if [[ $# -gt 0 && $1 == "-v" ]]; then
# 	verbose=1
# fi

while getopts "vk" arg; do
	case $arg in
		v) verbose=1;;
		k) justKillIt=1;;
	esac
done

if [[ $justKillIt -eq 1 ]]; then
	if [[ $verbose -eq 1 ]]; then
		echo 'Searching for running picom instance'
	fi
	if [[ $(pgrep -x "picom") != '' ]]; then
		PID=$(pidof "picom")
		if [[ $verbose -eq 1 ]]; then
			echo 'Found running instance of picom with pid '$PID
			echo 'Killing instance'
		fi
		kill -9 $PID
		if [[ $verbose -eq 1 ]]; then
			echo 'Killed picom instance with pid' $PID
		fi
		exit 0
	else
		if [[ $verbose -eq 1 ]]; then
			echo 'No running instance of picom found'
		fi
		exit 1
	fi
fi

res=$(pgrep -x picom)
if [[ $res  != '' ]]; then
	pid=$(pidof picom)
	if [[ $verbose -eq 1 ]]
	then
		echo 'killing process pid '$pid
	fi
	kill -9 $pid
	while pgrep -x picom >/dev/null; do sleep 1;
	done
fi

if [[ $verbose -eq 1 ]]; then
	picom &
else
	picom &>/dev/null &
fi

if [[ $verbose -eq 1 ]] 
then
	pid=$(pidof picom)
	echo 'launched new instance of picom with pid '$pid
fi
