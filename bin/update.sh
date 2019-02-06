#!/usr/bin/env bash

if [[ "${pattern}" == "" ]] ; then
	FOLDER_FROM_ANY_SUBMODULE=../../services
	REPO=${service}
	PACKAGE=${service}
else
	FOLDER_FROM_ANY_SUBMODULE=../../patterns
	REPO=${pattern}
	PACKAGE=pattern-$(sed 's/^[[:upper:]]/\L&/;s/[[:upper:]]/\L\-&/g' <<< ${pattern})
fi

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm i -D @musical-patterns/${REPO}@latest
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${PACKAGE}) ]] ; then
	npm i -P @musical-patterns/${REPO}@latest
fi
