#!/usr/bin/env bash

set -e

if [[ -n $(git status -s) ]] ; then
	make build
	npm version patch
#	npm publish --access public
else
	echo "Working tree clean. Nothing to publish."
fi
