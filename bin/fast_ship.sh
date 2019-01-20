#!/usr/bin/env bash

set -e

if [[ -n $(git status -s) || ${FORCE} == true ]] ; then
	make publish
	make commit
	make push
else
	echo "Working tree clean. Nothing to ship."
fi
