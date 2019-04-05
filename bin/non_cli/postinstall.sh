#!/usr/bin/env bash

set -e

echo "aaa"
CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL=../../../node_modules/@musical-patterns/cli
if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}" ]] ; then
	echo "aaab"
	bash bin/sharing/share_config.sh
fi
