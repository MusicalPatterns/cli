#!/usr/bin/env bash

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section.sh
. ${CLI_DIR:=./}bin/non_cli/fork_whether_pattern_or_service.sh

if [[ "${service}" == "cli" ]] ; then
	echo "Please run 'npm i @musical-patterns/cli@latest' yourself. I cannot do it for you, as I would try to delete myself as part of updating myself."
	exit 1
fi

install_in_correct_dependency_section @musical-patterns/${REPO}@latest
