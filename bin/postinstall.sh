#!/usr/bin/env sh

set -e

echo "testing"
echo "${PWD##*/}"

if [[ "${PWD##*/}" != "cli" ]] ; then
	echo "sharing"
	sh ./bin/share_config.sh
fi
