#!/usr/bin/env bash

set -e

. ${CLI_DIR:=.}/bin/non_cli/run_only_if_not_clean.sh

ship() {
	bash ${CLI_DIR:=.}/bin/sharing/check_config.sh
	make update || return
	make test || return
	make lint || return
	make fast-ship
}

run_only_if_not_clean ship
