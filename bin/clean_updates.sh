#!/usr/bin/env sh

set -e

pushd ${DIR:=.}
	rm -rf node_modules package-lock.json > /dev/null 2>&1 || true
	npm rm npm-check-updates npm-upgrade || true
	npm i
popd
