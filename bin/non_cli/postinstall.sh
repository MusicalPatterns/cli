#!/usr/bin/env bash

set -e

CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL=../../../node_modules/@musical-patterns/cli
if [[ -d "${CHECK_TO_MAKE_SURE_I_AM_RUNNING_AS_PART_OF_ANOTHER_MODULE_S_INSTALL}" ]] ; then
	FROM_CLI=true bash bin/sharing/share_config.sh
fi
