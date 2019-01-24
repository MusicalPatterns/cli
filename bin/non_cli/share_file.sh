#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

make_dir_for_file() {
	FILE="$1"
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	if [[ ${DIR} != "" ]] ; then
		mkdir -p ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${DIR}
	fi
}

share_file() {
	FILE="$1"
	make_dir_for_file ${FILE}

	cp ${FILE} ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}
export -f share_file
