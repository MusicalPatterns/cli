#!/usr/bin/env bash

set -e

. bin/sharing/share_files.sh
. bin/non_cli/services.sh

share_files_and_special_treatment_shared_files() {
	mv bin/sharing/gitignore ../../../.gitignore
	mv bin/sharing/npmignore ../../../.npmignore

	for i in "${!SERVICES[@]}" ; do
		share_files "${SERVICES[i]}"
	done
}

CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL=../../../node_modules/@musical-patterns/cli
if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}" ]] ; then
	share_files_and_special_treatment_shared_files
fi
