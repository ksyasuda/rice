#!/usr/bin/env bash

set -euo pipefail

NEXT=0
PREV=0
TOGGLE=0
VERBOSE='-q'
while getopts nptv options
do
	case $options in
		n)
			NEXT=1
			;;
		p)
			PREV=1
			;;
		t)
			TOGGLE=1
			;;
		v)
			VERBOSE='-v'
			;;
		?)
			echo 'something went wrong'
			exit 1
			;;
	esac
done

if [[ $NEXT -eq 1 ]]; then
	mpc next $VERBOSE 
elif [[ $PREV -eq 1 ]]; then
	mpc prev $VERBOSE
elif [[ $TOGGLE -eq 1 ]]; then
	mpc toggle $VERBOSE
fi
