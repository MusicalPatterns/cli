#!/usr/bin/env bash

set -e

check_match() {
	FILE="$1"

	set +e
	cmp -s "${FILE}" "node_modules/@musical-patterns/cli/share/${FILE}"
	if [[ $? != 0 ]] ; then
		echo "mismatch against standardized configuration: ${FILE}"
		set -e
		return 1
	fi
	set -e
}

shopt -s globstar
shopt -s dotglob
for SHARED_FILE in node_modules/@musical-patterns/cli/share/**/*
do
	if [[ -f "${SHARED_FILE}" && ${SHARED_FILE:41} != "gitignore" && ${SHARED_FILE:41} != "npmignore" ]]; then
		check_match ${SHARED_FILE:41}
	fi
done
