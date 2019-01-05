#!/usr/bin/env bash

set -e

if [[ -n $(git status -s) || ${FORCE} == true ]] ; then
	make build
	npm version patch > /dev/null 2>&1
	npm publish --access public
else
	echo "Working tree clean. Nothing to publish."
fi
