#!/usr/bin/env bash

set -e

. bin/non_cli/run_only_if_not_clean.sh

publish() {
	make build || return
	npm version patch > /dev/null 2>&1 || return
	npm publish --access public
}

run_only_if_not_clean publish
