#!/usr/bin/env bash

set -e

check_match() {
	FILE="$1"

	set +e
	cmp -s "${FILE}" "node_modules/@musical-patterns/cli/${FILE}"
	if [[ $? != 0 ]] ; then
		echo "mismatch: ${FILE}"
		set -e
		return 1
	fi
	set -e
}

while read SHARED_FILE ; do
	check_match "$SHARED_FILE"
done < node_modules/@musical-patterns/cli/bin/non_cli/shared_files.txt
