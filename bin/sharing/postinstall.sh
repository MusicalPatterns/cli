#!/usr/bin/env bash

set -e

. bin/sharing/share_files.sh

echo "RUNNING CLI POSTINSTALL"

share_files_and_special_treatment_shared_files() {
	mv bin/sharing/gitignore ../../../.gitignore
	mv bin/sharing/npmignore ../../../.npmignore

	SERVICES=("cli" "utilities" "performer" "compiler" "pattern" "snapshot" "playroom" "lab")
	for i in "${!SERVICES[@]}" ; do
		echo "- SHARING FILES FOR ""${SERVICES[i]}"

		share_files "${SERVICES[i]}"
	done
}

CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL=../../../node_modules/@musical-patterns/cli
if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}" ]] ; then
	share_files_and_special_treatment_shared_files
fi
