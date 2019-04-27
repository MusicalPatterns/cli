#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/support/run_only_if_not_clean.sh

fast_ship() {
	make publish || return
	make commit || return
	make push
}

ship() {
	bash ${CLI_DIR:=./}bin/sharing/check_config.sh
	make test types=true || return
	make lint || return
	fast_ship
}

if [[ ${fast} == 'true' ]] ; then
	run_only_if_not_clean fast_ship
else
	run_only_if_not_clean ship
fi
