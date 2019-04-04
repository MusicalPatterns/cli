#!/usr/bin/env bash

. ./node_modules/@musical-patterns/cli/bin/non_cli/install_in_correct_dependency_section_if_installed.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/fork_whether_pattern_or_service.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/services.sh
. ./node_modules/@musical-patterns/cli/bin/non_cli/patterns.sh

if [[ "${service}" == "cli" || "${service}" == "" ]] ; then
	make stop
fi

if [[ "${service}" == "" && "${pattern}" == "" ]] ; then
	DEV_DEPS_LIST=$(npm list -dev -depth 0 2>/dev/null || true)
	PROD_DEPS_LIST=$(npm list -prod -depth 0 2>/dev/null || true)

	for i in "${!SERVICES[@]}" ; do
		PACKAGE=${SERVICES[i]}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
	done
	for i in "${!PATTERNS[@]}" ; do
		CAMEL_CASE_PATTERN=${PATTERNS[i]}
		KEBAB_CASE_PATTERN=$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${CAMEL_CASE_PATTERN})
		PACKAGE=pattern-${KEBAB_CASE_PATTERN}
		install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
	done
else
	install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
fi

bash ./node_modules/@musical-patterns/cli/bin/sharing/share_config.sh
