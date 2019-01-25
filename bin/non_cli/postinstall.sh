#!/usr/bin/env bash

set -e

. bin/non_cli/run_only_if_not_self_installing.sh
. bin/non_cli/share_files.sh
. bin/non_cli/ignore_files.sh

share_config() {
	share_files

	mv ../../../gitignore ../../../.gitignore
	mv ../../../npmignore ../../../.npmignore

	ignore_files
}
export -f share_config

run_only_if_not_self_installing share_config
