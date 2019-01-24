#!/usr/bin/env bash

. bin/non_cli/share_files.sh
. bin/non_cli/ignore_files.sh

share_files

mv ../../../gitignore ../../../.gitignore
mv ../../../npmignore ../../../.npmignore

ignore_files
