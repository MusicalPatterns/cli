#!/usr/bin/env sh

set -e

rm -rf ../fake_npm_${REPO}

pushd ../${REPO}/
	make build
	npm pack
	mv *.tgz ..
popd

pushd ..
	tar -xvzf *.tgz
	mv package fake_npm_${REPO}
	rm *.tgz
popd

npm list -dev -depth 0 | grep -m1 @musical-patterns/${REPO} > /dev/null 2>&1
if [[ $? == 0 ]] ; then
	npm i -D ../fake_npm_${REPO}
fi
npm list -prod -depth 0 | grep -m1 @musical-patterns/${REPO} > /dev/null 2>&1
if [[ $? == 0 ]] ; then
	npm i ../fake_npm_${REPO}
fi
