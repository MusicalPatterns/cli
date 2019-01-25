#!/usr/bin/env bash

set -e

. bin/sharing/run_only_if_not_self_installing.sh
. bin/sharing/share_files.sh
. bin/sharing/ignore_files.sh

share_config() {
	share_files

	mv ../../../gitignore ../../../.gitignore
	mv ../../../npmignore ../../../.npmignore

	ignore_files
}
export -f share_config

run_only_if_not_self_installing share_config
