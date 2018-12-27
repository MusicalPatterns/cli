#!/usr/bin/env sh

set -e

pushd ${DIR:=.}
	rm package-lock.json || true
	rm -rf node_modules || true
	npm rm npm-check-updates npm-upgrade || true
	npm i
popd
