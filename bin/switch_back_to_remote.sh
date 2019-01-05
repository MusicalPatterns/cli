#!/usr/bin/env bash

set -e

rm -rf ../fake_npm_${SERVICE}

if [[ $(npm list -dev -depth 0 | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm rm @musical-patterns/${SERVICE}
	npm i -D @musical-patterns/${SERVICE}@latest
fi
if [[ $(npm list -prod -depth 0 | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm rm @musical-patterns/${SERVICE}
	npm i @musical-patterns/${SERVICE}@latest
fi
