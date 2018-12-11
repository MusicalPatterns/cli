#!/usr/bin/env sh

set -e

if [[ "${PWD##*/}" != "cli" ]] ; then
	sh ./bin/share_config.sh
fi
