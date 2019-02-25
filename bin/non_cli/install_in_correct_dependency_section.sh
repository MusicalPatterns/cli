#!/usr/bin/env bash

install_in_correct_dependency_section() {
	DEPENDENCY="$1"

	if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
		npm i -D "${DEPENDENCY}"
	fi
	if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
		npm i -P "${DEPENDENCY}"
	fi
}
export -f install_in_correct_dependency_section
