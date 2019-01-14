#!/usr/bin/env bash

set -e

SERVICES_FOLDER_FROM_ANY_SUBMODULE=../../services

rm -rf ../fake_npm_${SERVICE}

pushd ${SERVICES_FOLDER_FROM_ANY_SUBMODULE}/${SERVICE}/ > /dev/null 2>&1
	make build_local
	npm pack
	mv *.tgz ..
popd > /dev/null 2>&1

pushd ${SERVICES_FOLDER_FROM_ANY_SUBMODULE} > /dev/null 2>&1
	tar -xvzf *.tgz
	mv package fake_npm_${SERVICE}
	rm *.tgz
popd > /dev/null 2>&1

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm i -D ${SERVICES_FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${SERVICE}
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm i ${SERVICES_FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${SERVICE}
fi
