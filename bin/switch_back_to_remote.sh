#!/usr/bin/env bash

set -e

rm -rf ../fake_npm_${REPO}

if [[ $(npm list -dev -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm rm @musical-patterns/${REPO}
	npm i -D @musical-patterns/${REPO}@latest
fi
if [[ $(npm list -prod -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm rm @musical-patterns/${REPO}
	npm i @musical-patterns/${REPO}@latest
fi
