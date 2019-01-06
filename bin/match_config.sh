#!/usr/bin/env bash

check_match() {
	FILE="$1"

	cmp -s "${FILE}" "node_modules/@musical-patterns/cli/${FILE}"
	if [[ $? != 0 ]] ; then
		echo "mismatch: ${FILE}"
		return 1
	fi
}

while read SHARED_FILE ; do
	check_match "$SHARED_FILE"
done < bin/non_cli/shared_files.txt
