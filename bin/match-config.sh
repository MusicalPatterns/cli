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
for SHARED_FILE in node_modules/@musical-patterns/cli/share/**/*
do
	if [[ -f "${SHARED_FILE}" ]]; then
		echo "highly doubt this will work"
		echo ${SHARED_FILE:8}
		echo ${SHARED_FILE}
		check_match ${SHARED_FILE:8}
	fi
done
