#!/usr/bin/env bash

set -e

. ${CLI_DIR:=.}/bin/sharing/check_matches.sh
. ${CLI_DIR:=.}/bin/non_cli/services.sh

for i in "${!SERVICES[@]}" ; do
	check_matches "${SERVICES[i]}"
done
