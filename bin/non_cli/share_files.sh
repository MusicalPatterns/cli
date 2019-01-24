#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/non_cli/share_file.sh

share_files() {
	shopt -s globstar
	for SHARED_FILE in ./share/**/*
	do
		share_file "$SHARED_FILE"
	done
}
export -f share_files
