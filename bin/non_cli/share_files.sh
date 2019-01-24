#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/non_cli/share_file.sh

share_files() {
	shopt -s globstar
	for SHARED_FILE in ./share/**/*
	do
	    if [[ -f "${SHARED_FILE}" ]]; then
	    	share_file "$SHARED_FILE"
		fi
	done
}
export -f share_files
