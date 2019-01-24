#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

ignore_file() {
	FILE="$1"

	grep -q -x -F "${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore || echo "${FILE}" >> ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore

	sed -e
}
export -f ignore_file
