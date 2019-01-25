#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

ignore_file() {
	FILE="$1"

	if [[ ${FILE} == "LICENSE" ]] ; then
		return 0
	fi

	grep -q -x -F "${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore || echo "${FILE}" >> ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore
}
export -f ignore_file
