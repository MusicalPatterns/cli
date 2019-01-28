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
	FILE="$1"
	make_dir_for_file ${FILE}
	cp "share/${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
	ignore_file ${FILE}
}

share_files() {
	SERVICE=${1:=cli}

	shopt -s globstar
	shopt -s dotglob
	SHARED_DIR=node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}
	for SHARED_FILE in ${SHARED_DIR}**/*
	do
		echo "--- trying to share file"${SHARED_FILE}
	    if [[ -f "${SHARED_FILE}" ]]; then
	    	echo "yes"${SHARED_FILE:SHARED_DIR_PATH_CHAR_LENGTH}
			share_file ${SHARED_FILE:SHARED_DIR_PATH_CHAR_LENGTH}
		fi
	done
}
export -f share_files
