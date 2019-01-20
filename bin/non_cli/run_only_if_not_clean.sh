#!/usr/bin/env bash

run_only_if_not_clean() {
	CMD="$1"
	if [[ -n $(git status -s) || ${force} == true ]] ; then
		eval "${CMD}"
	else
		echo "Not running command because git working space is clean. Re-run with force=true if desired."
	fi
}
export -f run_only_if_not_clean
