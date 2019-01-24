#!/usr/bin/env bash

. bin/non_cli/share_files.sh

share_files

while read OTHER_SHARED_FILE ; do
	share_file "$OTHER_SHARED_FILE"
done < ./bin/non_cli/other_shared_files.txt

cp share/gitignore ../../../.gitignore
cp share/npmignore ../../../.npmignore
