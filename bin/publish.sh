#!/usr/bin/env bash

set -e

CUSTOM_DIR=${1}
DIR=${CUSTOM_DIR:=.}

make build
pushd ${DIR:=.}
	export VERSION=$(npm version patch)
	npm publish --access public
popd
