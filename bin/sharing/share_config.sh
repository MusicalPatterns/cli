#!/usr/bin/env bash

if [[ CLI_DIR == "" ]] ; then
	ESCAPE_CLI_DIR="../../../"
else
	ESCAPE_CLI_DIR=""
fi

. ${CLI_DIR:=./}bin/non_cli/services.sh

add_config_file_to_gitignore() {
	FILE="$1"

	if [[ ${FILE} == "LICENSE" || ${FILE} == ".travis.yml" ]] ; then
		return 0
	fi

	grep -q -x -F "${FILE}" ${ESCAPE_CLI_DIR}.gitignore || echo "${FILE}" >> ${ESCAPE_CLI_DIR}.gitignore
}
export -f add_config_file_to_gitignore

make_dir_for_config_file_if_necessary() {
	FILE="$1"
	set +e
	DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
	set -e
	if [[ ${DIR} != "" ]] ; then
		mkdir -p ${ESCAPE_CLI_DIR}${DIR}
	fi
}
export -f make_dir_for_config_file_if_necessary

share_config_file() {
	LENGTH_TO_STRIP=$1
	FILE_TO_SHARE=$2
	FILENAME=${2:LENGTH_TO_STRIP}

	make_dir_for_config_file_if_necessary ${FILENAME}
	cp ${FILE_TO_SHARE} ${ESCAPE_CLI_DIR}${FILENAME}

	add_config_file_to_gitignore ${FILENAME}
}
export -f share_config_file

share_config_files_for_service() {
	SERVICE=${1:=cli}

	SHARED_DIR=${ESCAPE_CLI_DIR}node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}

	if [[ -d ${SHARED_DIR} ]] ; then
		find ${SHARED_DIR} -type f -exec bash -c 'share_config_file "$0" "$1"' ${SHARED_DIR_PATH_CHAR_LENGTH} {} \;
	fi
}
export -f share_config_files_for_service

cp ${CLI_DIR:=./}bin/sharing/gitignore ${ESCAPE_CLI_DIR}.gitignore
cp ${CLI_DIR:=./}bin/sharing/npmignore ${ESCAPE_CLI_DIR}.npmignore

for i in "${!SERVICES[@]}" ; do
	share_config_files_for_service "${SERVICES[i]}"
done
