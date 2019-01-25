#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/sharing/share_file.sh

share_files() {
	shopt -s globstar
	shopt -s dotglob
	for SHARED_FILE in ./share/**/*
	do
	    if [[ -f "${SHARED_FILE}" ]]; then
			share_file ${SHARED_FILE:8}
		fi
	done
}
export -f share_files
