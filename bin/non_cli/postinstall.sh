#!/usr/bin/env bash

set -e

. bin/non_cli/run_only_if_not_self_installing

run_only_if_not_self_installing "sh ./bin/non_cli/share_config.sh"
