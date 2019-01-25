#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/sharing/ignore_file.sh

ignore_files() {
	shopt -s globstar
	shopt -s dotglob
	for SHARED_FILE in ./share/**/*
	do
	    if [[ -f "${SHARED_FILE}" ]]; then
			ignore_file ${SHARED_FILE:8}
		fi
	done
}
export -f ignore_files
