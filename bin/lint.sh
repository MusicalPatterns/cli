#!/usr/bin/env bash

set -e

if [[ ${PATTERN} == "" || ${PATTERN} == "ALL" ]] ; then
	DIR="."
else
	DIR="./src/${PATTERN}"
fi

tslint "${DIR}/src/**/*.ts{,x}" -e **/dist/** --fix -p ./tsconfig.json
tslint "${DIR}/test/**/*.ts{,x}" --fix -p ./tsconfig-node.json
