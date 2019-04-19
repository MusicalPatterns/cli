#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/non_cli/run_only_if_not_clean.sh

fast_ship() {
	make publish || return
	make commit || return
	make push
}

ship() {
	bash ${CLI_DIR:=./}bin/sharing/check_config.sh
	TYPE_CHECK=true make test || return
	make lint || return
	fast_ship
}

if [[ ${fast} == 'true' ]] ; then
	run_only_if_not_clean fast_ship
else
	run_only_if_not_clean ship
fi
