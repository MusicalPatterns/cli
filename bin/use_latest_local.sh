#!/usr/bin/env bash

set -e

rm -rf ../fake_npm_${REPO}

pushd ../${REPO}/ > /dev/null 2>&1
	make build_dev
	npm pack
	mv *.tgz ..
popd > /dev/null 2>&1

pushd .. > /dev/null 2>&1
	tar -xvzf *.tgz
	mv package fake_npm_${REPO}
	rm *.tgz
popd > /dev/null 2>&1

if [[ $(npm list -dev -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i -D ../fake_npm_${REPO}
fi
if [[ $(npm list -prod -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i ../fake_npm_${REPO}
fi
