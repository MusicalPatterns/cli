#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section_if_installed.sh
. ${CLI_DIR:=./}bin/non_cli/fork_whether_pattern_or_service.sh

rm -rf ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}

pushd ${FOLDER_FROM_ANY_SUBMODULE}/${REPO}/ > /dev/null 2>&1
	if [[ "${built}" != "true" ]] ; then
		make build-local
	fi

	npm pack
	mv *.tgz ../fake_npm_${REPO}.tgz
popd > /dev/null 2>&1

install_in_correct_dependency_section_if_installed ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}.tgz
