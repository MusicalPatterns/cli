#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

make_dir_for_file() {
	FILE="$1"
	echo "i am supposed to make dir for file"
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	echo "here is a dir"
	echo ${DIR}
	[[ ${DIR} != "" ]] && mkdir -p ${DIR}
}

share_file() {
	FILE="$1"
	make_dir_for_file ${FILE}

	cp ${FILE} ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}
export -f share_file

share_file_with_npm_struggles() {
	FILE="$1"
	make_dir_for_file ${FILE}

	cp "${FILE}.for-sharing" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}
export -f share_file_with_npm_struggles
