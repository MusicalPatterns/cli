#!/usr/bin/env sh

set -e

if [[ ${PATTERN} == "" ]] ; then
	DIR="."
else
	DIR="./src/${PATTERN}"
fi

tslint "${DIR}/src/**/*.ts{,x}" -e **/dist/** --fix -p ./tsconfig.json
tslint "${DIR}/test/**/*.ts{,x}" --fix -p ./tsconfig-node.json
