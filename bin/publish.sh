#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/non_cli/run_only_if_not_clean.sh

publish() {
	npm version patch > /dev/null 2>&1 || return
	make build || return
	npm publish --access public
}

run_only_if_not_clean publish
