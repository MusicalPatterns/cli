#!/usr/bin/env sh

rm -rf dist/

npm run build
export BUILD_FAILED=$?

if [[ ${BUILD_FAILED} != 0 ]] ; then
	exit 1
fi
