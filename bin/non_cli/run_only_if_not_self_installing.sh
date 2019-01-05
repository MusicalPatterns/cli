#!/bin/bash

echo "bash version in the file with the export"
bash --version
echo ${BASH_VERSION}

CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL="../../../"

run_only_if_not_self_installing() {
	CMD="$1"
	if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}node_modules" ]] ; then
		eval "${CMD}"
	fi
}
export -f run_only_if_not_self_installing
