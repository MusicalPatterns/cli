#!/usr/bin/env bash

. bin/non_cli/share_file.sh

while read SHARED_FILE ; do
	share_file "$SHARED_FILE"
done < bin/non_cli/shared_files.txt

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
