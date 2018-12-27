#!/usr/bin/env sh

set -e

pushd ${DIR:=.}
	rm package-lock.json
	rm -rf node_modules
	npm rm npm-check-updates npm-upgrade
	npm i
popd
