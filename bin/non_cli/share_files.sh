#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/non_cli/share_file.sh

share_files() {
	echo "111"
	shopt -s globstar
	echo "222"
	shopt -s dotglob
	echo "333"
	for SHARED_FILE in ./share/**/*
	do
		echo "444"${SHARED_FILE}
	    if [[ -f "${SHARED_FILE}" ]]; then
	    	echo "555"${SHARED_FILE:8}
			share_file ${SHARED_FILE:8}
			echo "666"
		fi
	done
}
export -f share_files
