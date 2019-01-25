#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

ignore_file() {
	FILE="$1"

	if [[ ${FILE} == "LICENSE" ]] ; then
		return 0
	fi

	grep -q -x -F "${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore || echo "${FILE}" >> ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore
}

make_dir_for_file() {
	FILE="$1"
	set +e
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	set -e
	if [[ ${DIR} != "" ]] ; then
		mkdir -p ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${DIR}
	fi
}

share_file() {
	FILE="$1"
	make_dir_for_file ${FILE}
	cp "share/${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
	ignore_file ${FILE}
}
export -f share_file
