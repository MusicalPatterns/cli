#!/usr/bin/env bash

. ${CLI_DIR:=./}bin/non_cli/install_in_correct_dependency_section_if_installed.sh
. ${CLI_DIR:=./}bin/non_cli/fork_whether_pattern_or_service.sh
. ${CLI_DIR:=./}bin/non_cli/services.sh
. ${CLI_DIR:=./}bin/non_cli/patterns.sh

if [[ "${service}" == "cli" ]] ; then
	echo "Please run 'npm i @musical-patterns/cli@latest' yourself. I cannot do it for you, as I would try to delete myself as part of updating myself."
	exit 1
fi

if [[ "${service}" == "" && "${pattern}" == "" ]] ; then
	make stop

	for i in "${!SERVICES[@]}" ; do
		SERVICE_TO_UPDATE=${SERVICES[i]}
		if [[ ${SERVICE_TO_UPDATE} != "cli" ]] ; then
			install_in_correct_dependency_section_if_installed @musical-patterns/${SERVICE_TO_UPDATE}@latest
		fi
	done
	for i in "${!PATTERNS[@]}" ; do
		PATTERN_TO_UPDATE=pattern-${PATTERNS[i]}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PATTERN_TO_UPDATE}@latest
	done
else
	install_in_correct_dependency_section_if_installed @musical-patterns/${REPO}@latest
fi
