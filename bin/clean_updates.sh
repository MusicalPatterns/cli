#!/usr/bin/env sh

set -e

pushd ${DIR:=.}
	npm rm npm-check-updates npm-upgrade
	npm i
popd
