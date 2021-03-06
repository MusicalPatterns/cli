#!/usr/bin/env bash

. ./node_modules/@musical-patterns/cli/bin/support/install_in_correct_dependency_section_if_installed.sh
. ./node_modules/@musical-patterns/cli/bin/support/fork_whether_pattern_or_service.sh
. ./node_modules/@musical-patterns/cli/bin/support/services.sh
. ./node_modules/@musical-patterns/cli/bin/support/patterns.sh

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
	if [[ "${service}" == *","* ]]; then
		IFS=',' read -r -a services <<< "${service}"

		for index in "${!services[@]}" ; do
			make update service=${services[index]}
		done
	else
		if [[ "${pattern}" == *","* ]]; then
			IFS=',' read -r -a patterns <<< "${pattern}"

			for index in "${!patterns[@]}" ; do
				make update pattern=${patterns[index]}
			done
		else
			if [[ "${service}" != "" ]] ; then
				if printf '%s\n' ${SERVICES[@]} | grep -q -P '^'${service}'$'; then
					:
				else
					echo "${service} is not a recognized service. Please try updating again."
					exit 1
				fi
			fi

			if [[ "${pattern}" != "" ]] ; then
				if printf '%s\n' ${PATTERNS[@]} | grep -q -P '^'${pattern}'$'; then
					:
				else
					echo "${pattern} is not a recognized pattern. Please try updating again."
					exit 1
				fi
			fi

			install_in_correct_dependency_section_if_installed @musical-patterns/${PACKAGE}@latest
		fi
	fi
fi

CLI_DIR="./node_modules/@musical-patterns/cli/" bash ./node_modules/@musical-patterns/cli/bin/sharing/share_config.sh
