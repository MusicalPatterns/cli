#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

make_dir_for_file() {
	FILE="$1"
	echo "ok making a dir which for some reason breaks now"
	set +e
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	echo "and the dir is"${DIR}
	set -e
	if [[ ${DIR} != "" ]] ; then
		echo "so we are trying to make this dir"
		echo ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${DIR}
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
