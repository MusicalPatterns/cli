#!/usr/bin/env sh

BUILD_CMD="$1"

rm -rf dist/

${UTILITIES_DIRECTORY}cli/share.sh tsconfig.json
${UTILITIES_DIRECTORY}cli/share.sh tsconfig-common.json

eval "${BUILD_CMD}"
export BUILD_FAILED=$?

${UTILITIES_DIRECTORY}cli/unshare.sh tsconfig.json
${UTILITIES_DIRECTORY}cli/unshare.sh tsconfig-common.json

if [[ ${BUILD_FAILED} != 0 ]] ; then
	exit 1
fi
