#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section.sh
. ${CLI_DIR:=./}bin/non_cli/fork_whether_pattern_or_service.sh

rm ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}.tgz

install_in_correct_dependency_section @musical-patterns/${REPO}@latest
