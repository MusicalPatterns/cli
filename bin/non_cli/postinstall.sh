#!/bin/bash

echo "bash version"
bash --version
echo ${BASH_VERSION}

set -e

. bin/non_cli/run_only_if_not_self_installing.sh

run_only_if_not_self_installing "sh ./bin/non_cli/share_config.sh"
