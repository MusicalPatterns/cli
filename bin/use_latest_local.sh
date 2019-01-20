#!/usr/bin/env bash

set -e

if [[ "${PATTERN}" == "" ]] ; then
	FOLDER_FROM_ANY_SUBMODULE=../../services
	REPO=${SERVICE}
	PACKAGE=${SERVICE}
else
	FOLDER_FROM_ANY_SUBMODULE=../../patterns
	REPO=${PATTERN}
	PACKAGE=pattern-$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${PATTERN})
fi

rm -rf ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}

pushd ${FOLDER_FROM_ANY_SUBMODULE}/${REPO}/ > /dev/null 2>&1
	make build_local
	npm pack
	mv *.tgz ..
popd > /dev/null 2>&1

pushd ${FOLDER_FROM_ANY_SUBMODULE} > /dev/null 2>&1
	tar -xvzf *.tgz
	mv package fake_npm_${REPO}
	rm *.tgz
popd > /dev/null 2>&1

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm i -D ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm i ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}
fi
