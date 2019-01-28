#!/usr/bin/env bash

check_match() {
	FILE="$1"
	SERVICE="$2"

	set +e
	cmp -s "${FILE}" "node_modules/@musical-patterns/${SERVICE}/share/${FILE}"
	if [[ $? != 0 ]] ; then
		echo "mismatch against standardized configuration: ${FILE}. Please re-run 'npm i @musical-patterns/${SERVICE}'."
		set -e
		return 1
	fi
	set -e
}

check_matches() {
	SERVICE=${1:=cli}

	shopt -s globstar
	shopt -s dotglob
	SHARED_DIR=node_modules/@musical-patterns/${SERVICE}/share/
	SHARED_DIR_PATH_CHAR_LENGTH=${#SHARED_DIR}
	for SHARED_FILE in ${SHARED_DIR}**/*
	do
		echo "--- trying to match file"${SHARED_FILE}
		if [[ -f "${SHARED_FILE}" ]]; then
			check_match ${SHARED_FILE:SHARED_DIR_PATH_CHAR_LENGTH} ${SERVICE}
		fi
	done
}
export -f check_matches
