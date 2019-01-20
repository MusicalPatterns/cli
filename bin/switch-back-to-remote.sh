#!/usr/bin/env bash

set -e

if [[ "${PATTERN}" == "" ]] ; then
	FOLDER_FROM_ANY_SUBMODULE=../../services
	REPO=${SERVICE}
	PACKAGE=${SERVICE}
else
	FOLDER_FROM_ANY_SUBMODULE=../../patterns
	REPO=${PATTERN}
	PACKAGE=pattern-$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${PATTERN})
fi

rm -rf ${FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${REPO}

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm rm @musical-patterns/${REPO}
	npm i -D @musical-patterns/${REPO}@latest
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm rm @musical-patterns/${REPO}
	npm i @musical-patterns/${REPO}@latest
fi
