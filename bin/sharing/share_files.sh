#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

ignore_file() {
	FILE="$1"

	if [[ ${FILE} == "LICENSE" || ${FILE} == ".travis.yml" ]] ; then
		return 0
	fi

	echo "catting some gitignores"
	cat ./.gitignore
	cat ../.gitignore
	cat ../../.gitignore
	cat ../../../.gitignore
	cat ../../../../.gitignore
	cat ../../../../../.gitignore

	grep -q -x -F "${FILE}" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore || echo "${FILE}" >> ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}.gitignore
}
export -f ignore_file

make_dir_for_file() {
	FILE="$1"
	set +e
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	set -e
	if [[ ${DIR} != "" ]] ; then
		mkdir -p ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${DIR}
	fi
}
export -f make_dir_for_file

share_file() {
	LENGTH_TO_STRIP=$1
	FILE_TO_SHARE=$2
	FILENAME=${2:LENGTH_TO_STRIP}

	make_dir_for_file ${FILENAME}
	cp ${FILE_TO_SHARE} ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILENAME}

	echo "contents of folder i just copied to"
	ls ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}
	echo "and our present working directory" $PWD

	ignore_file ${FILENAME}
}
export -f share_file

share_files() {
	SERVICE=${1:=cli}

	SHARED_DIR=${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}

	if [[ -d ${SHARED_DIR} ]] ; then
		find ${SHARED_DIR} -type f -exec bash -c 'share_file "$0" "$1"' ${SHARED_DIR_PATH_CHAR_LENGTH} {} \;
	fi
}
export -f share_files
