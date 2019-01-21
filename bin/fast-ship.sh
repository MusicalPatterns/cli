#!/usr/bin/env bash

set -e

. ${CLI_DIR:=.}/bin/non_cli/run_only_if_not_clean.sh

fast_ship() {
	make commit || return
	make publish || return
	make push
}

run_only_if_not_clean fast_ship
