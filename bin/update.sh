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
	DEV_DEPS_LIST=$(npm list -dev -depth 0 2>/dev/null)
	PROD_DEPS_LIST=$(npm list -prod -depth 0 2>/dev/null)

	for i in "${!SERVICES[@]}" ; do
		PACKAGE=${SERVICES[i]}
		if [[ ${PACKAGE} != "cli" ]] ; then
			install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
		fi
	done
	for i in "${!PATTERNS[@]}" ; do
		PACKAGE=pattern-${PATTERNS[i]}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
	done
else
	install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
fi
