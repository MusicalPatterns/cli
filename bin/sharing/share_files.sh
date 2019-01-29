#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

ignore_file() {
	FILE="$1"

	if [[ ${FILE} == "LICENSE" || ${FILE} == ".travis.yml" ]] ; then
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
	LENGTH_TO_STRIP=$1
	FILE=${2:LENGTH_TO_STRIP}
	echo "file to share"${FILE}
	echo "what it would have ben"${2}
	make_dir_for_file ${FILE}
	cp "share/${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
	ignore_file ${FILE}
}

share_files() {
	SERVICE=${1:=cli}

	SHARED_DIR=node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}

	find ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${SHARED_DIR} -type f -exec bash -c 'share_file "$0" "$1"' ${SHARED_DIR_PATH_CHAR_LENGTH} {} \;
}
export -f share_files
