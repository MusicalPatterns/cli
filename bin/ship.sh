#!/usr/bin/env bash

set -e

. ${CLI_DIR:=.}/bin/non_cli/run_only_if_not_clean.sh

ship() {
	make match_config || return
	make test || return
	make lint || return
	make fast_ship
}

run_only_if_not_clean ship
