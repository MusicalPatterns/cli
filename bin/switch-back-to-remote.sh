#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/support/install_in_correct_dependency_section_if_installed.sh
. ${CLI_DIR:=./}bin/support/fork_whether_pattern_or_service.sh

rm ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}.tgz

install_in_correct_dependency_section_if_installed @musical-patterns/${REPO}@latest
