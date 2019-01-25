#!/usr/bin/env bash

set -e

. bin/sharing/run_only_if_not_self_installing.sh
. bin/sharing/share_files.sh

share_files_and_special_treatment_shared_files() {
	mv bin/sharing/gitignore ../../../.gitignore
	mv bin/sharing/npmignore ../../../.gitignore

	share_files
}

run_only_if_not_self_installing share_files_and_special_treatment_shared_files
