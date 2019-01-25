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
	echo "!!!"
	FILE="$1"
	echo "@@@"
	make_dir_for_file ${FILE}
	echo "###"

	cp "share/${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
	echo "%%%"
}
export -f share_file
