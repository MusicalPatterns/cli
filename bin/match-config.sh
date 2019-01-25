#!/usr/bin/env bash

set -e

. ${CLI_DIR:=.}/bin/sharing/check_matches.sh

SERVICES=("cli" "utilities" "performer" "compiler" "pattern" "snapshot" "playroom" "lab")
for i in "${!SERVICES[@]}" ; do
	check_matches "${SERVICES[i]}"
done
