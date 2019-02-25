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

rm ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}.tgz

install_in_correct_dependency_section @musical-patterns/${REPO}@latest
