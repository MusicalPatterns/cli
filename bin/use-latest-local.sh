#!/usr/bin/env bash

set -e

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section.sh

if [[ "${pattern}" == "" ]] ; then
	FOLDER_FROM_ANY_SUBMODULE=../../services
	REPO=${service}
	PACKAGE=${service}
else
	FOLDER_FROM_ANY_SUBMODULE=../../patterns
	REPO=${pattern}
	PACKAGE=pattern-$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${pattern})
fi

rm -rf ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}

pushd ${FOLDER_FROM_ANY_SUBMODULE}/${REPO}/ > /dev/null 2>&1
	if [[ "${built}" != "true" ]] ; then
		make build-local
	fi

	npm pack
	mv *.tgz ../fake_npm_${REPO}.tgz
popd > /dev/null 2>&1

install_in_correct_dependency_section ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}.tgz
