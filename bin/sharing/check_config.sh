#!/usr/bin/env bash

. ${CLI_DIR:=./}bin/support/services.sh

check_config_file() {
	FILE="$1"
	SERVICE="$2"

	set +e
	cmp -s "${FILE}" "node_modules/@musical-patterns/${SERVICE}/share/${FILE}"
	if [[ $? != 0 ]] ; then
		echo "mismatch against standardized configuration: ${FILE}. Please fix manually, or re-run 'make update'."
		set -e
		return 1
	fi
	set -e
}

check_config_files_for_service() {
	SERVICE=${1:=cli}

	shopt -s globstar
	shopt -s dotglob
	SHARED_DIR=node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}
	for SHARED_FILE in ${SHARED_DIR}**/* ; do
		if [[ -f "${SHARED_FILE}" ]] ; then
			check_config_file ${SHARED_FILE:SHARED_DIR_PATH_CHAR_LENGTH} ${SERVICE}
		fi
	done
}
export -f check_config_files_for_service

for i in "${!SERVICES[@]}" ; do
	check_config_files_for_service "${SERVICES[i]}"
done
