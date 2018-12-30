#!/usr/bin/env bash

set -e

rm -rf ../fake_npm_${REPO}

pushd ../${REPO}/
	make build_dev
	npm pack
	mv *.tgz ..
popd

pushd ..
	tar -xvzf *.tgz
	mv package fake_npm_${REPO}
	rm *.tgz
popd

if [[ $(npm list -dev -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i -D ../fake_npm_${REPO}
fi
if [[ $(npm list -prod -depth 0 | grep -m1 @musical-patterns/${REPO}) ]] ; then
	npm i ../fake_npm_${REPO}
fi
