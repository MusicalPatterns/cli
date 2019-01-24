#!/usr/bin/env bash

. ${CLI_DIR:=.}/bin/non_cli/share_file.sh

share_files() {
	while read SHARED_FILE ; do
		share_file "$SHARED_FILE"
	done < ${CLI_DIR:=.}/bin/non_cli/shared_files.txt
}
export -f share_files
