#!/usr/bin/env sh

set -e

rm -rf ../fake_npm_${REPO}

npm uninstall @musical-patterns/${REPO}
if [[ $(npm list -dev -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i -D @musical-patterns/${REPO}@latest
fi
if [[ $(npm list -prod -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i @musical-patterns/${REPO}@latest
fi
