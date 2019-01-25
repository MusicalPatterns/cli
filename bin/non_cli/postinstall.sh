#!/usr/bin/env bash

set -e

echo "A"
. bin/non_cli/run_only_if_not_self_installing.sh
echo "B"
. bin/non_cli/share_files.sh
echo "C"
. bin/non_cli/ignore_files.sh
echo "D"

share_config() {
	echo "I"

	share_files
	echo "J"

	mv ../../../gitignore ../../../.gitignore
	echo "K"
	mv ../../../npmignore ../../../.npmignore
	echo "L"
	ignore_files
	echo "M"
}
export -f share_config
echo "E"

run_only_if_not_self_installing share_config
