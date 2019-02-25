#!/usr/bin/env bash

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section.sh

if [[ "${service}" == "cli" ]] ; then
	echo "Please run 'npm i @musical-patterns/cli@latest' yourself. I cannot do it for you, as I would try to delete myself as part of updating myself."
	exit 1
fi

if [[ "${pattern}" == "" ]] ; then
	FOLDER_FROM_ANY_SUBMODULE=../../services
	REPO=${service}
	PACKAGE=${service}
else
	FOLDER_FROM_ANY_SUBMODULE=../../patterns
	REPO=${pattern}
	PACKAGE=pattern-$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${pattern})
fi

install_in_correct_dependency_section @musical-patterns/${REPO}@latest
