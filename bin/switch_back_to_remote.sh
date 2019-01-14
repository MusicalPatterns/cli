#!/usr/bin/env bash

set -e

SERVICES_FOLDER_FROM_ANY_SUBMODULE=../../services

rm -rf ${SERVICES_FOLDER_FROM_ANY_SUBMODULE}/fake_npm_${SERVICE}

if [[ $(npm list -dev -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm rm @musical-patterns/${SERVICE}
	npm i -D @musical-patterns/${SERVICE}@latest
fi
if [[ $(npm list -prod -depth 0 2>/dev/null | grep -m1 @musical-patterns/${SERVICE}) ]] ; then
	npm rm @musical-patterns/${SERVICE}
	npm i @musical-patterns/${SERVICE}@latest
fi
