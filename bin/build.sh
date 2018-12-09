#!/usr/bin/env sh

BUILD_CMD="$1"
DEFAULT_BUILD_CMD="tsc -p tsconfig-library.json"

rm -rf dist/

eval "${BUILD_CMD:=${DEFAULT_BUILD_CMD}}"
BUILD_FAILED=$?

if [[ ${BUILD_FAILED} != 0 ]] ; then
	exit 1
fi
