#!/usr/bin/env sh

BUILD_CMD="$1"

rm -rf dist/

eval "${BUILD_CMD}"
export BUILD_FAILED=$?

if [[ ${BUILD_FAILED} != 0 ]] ; then
	exit 1
fi
