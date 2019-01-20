#!/usr/bin/env bash

. bin/non_cli/share_file.sh

while read SHARED_FILE ; do
	share_file "$SHARED_FILE"
done < bin/non_cli/shared_files.txt

cp share/gitignore ../../../.gitignore
cp share/npmignore ../../../.npmignore
