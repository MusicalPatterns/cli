#!/usr/bin/env bash

install_in_correct_dependency_section_if_installed() {
	DEPENDENCY="$1"

	DEV_DEPS_LIST=${DEV_DEPS_LIST:=$(npm list -dev -depth 0 2>/dev/null)}
	if [[ $(echo ${DEV_DEPS_LIST} | grep -m1 "\-\-\ @musical-patterns/${PACKAGE}@") ]] ; then
		npm i -D "${DEPENDENCY}"
	fi
	PROD_DEPS_LIST=${PROD_DEPS_LIST:=$(npm list -prod -depth 0 2>/dev/null)}
	if [[ $(echo ${PROD_DEPS_LIST} | grep -m1 "\-\-\ @musical-patterns/${PACKAGE}@") ]] ; then
		npm i -P "${DEPENDENCY}"
	fi
}
export -f install_in_correct_dependency_section_if_installed
