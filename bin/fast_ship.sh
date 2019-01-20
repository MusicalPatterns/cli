#!/usr/bin/env bash

set -e

. bin/non_cli/run_only_if_not_clean.sh

fast_ship() {
	make publish || return
	make commit || return
	make push
}

run_only_if_not_clean fast_ship
