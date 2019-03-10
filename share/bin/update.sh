#!/usr/bin/env bash

. ./node_modules/@musical-patterns/cli/bin/non_cli/install_in_correct_dependency_section_if_installed.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/fork_whether_pattern_or_service.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/services.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/patterns.sh

if [[ "${service}" == "" && "${pattern}" == "" ]] ; then
	make stop
	DEV_DEPS_LIST=$(npm list -dev -depth 0 2>/dev/null)
	PROD_DEPS_LIST=$(npm list -prod -depth 0 2>/dev/null)

	for i in "${!SERVICES[@]}" ; do
		PACKAGE=${SERVICES[i]}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
	done
	for i in "${!PATTERNS[@]}" ; do
		PACKAGE=pattern-${PATTERNS[i]}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
	done
else
	install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
fi
