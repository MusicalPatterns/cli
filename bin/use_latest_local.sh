#!/usr/bin/env bash

set -e

rm -rf ../fake_npm_${SERVICE}

pushd ../${SERVICE}/ > /dev/null 2>&1
	make build_local
	npm pack
	mv *.tgz ..
popd > /dev/null 2>&1

pushd .. > /dev/null 2>&1
	tar -xvzf *.tgz
	mv package fake_npm_${SERVICE}
	rm *.tgz
popd > /dev/null 2>&1

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm i -D ../fake_npm_${SERVICE}
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm i ../fake_npm_${SERVICE}
fi
