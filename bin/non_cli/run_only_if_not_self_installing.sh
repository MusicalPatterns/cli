#!/usr/bin/env bash

CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL="../../../"

run_only_if_not_self_installing() {
	echo "F"
	CMD=$1
	if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}node_modules" ]] ; then
		echo "G"
		${CMD}
		echo "H"
	fi
}
export -f run_only_if_not_self_installing
