#!/usr/bin/env sh

set -e

DIR=${DIR:=.}

tslint "${DIR}/src/**/*.ts{,x}" -e **/dist/** --fix -p ./tsconfig.json
tslint "${DIR}/test/**/*.ts{,x}" --fix -p ./tsconfig-node.json
