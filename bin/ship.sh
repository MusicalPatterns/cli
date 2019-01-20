#!/usr/bin/env bash

set -e

if [[ -n $(git status -s) || ${FORCE} == true ]] ; then
	make match_config
	make test
	make lint
	make fast_ship
else
	echo "Working tree clean. Nothing to ship."
fi
