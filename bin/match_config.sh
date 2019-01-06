#!/usr/bin/env bash

set -e

check_match() {
	FILE="$1"

	if [[ cmp -s "${FILE}" node_modules/@musical-patterns/cli"${FILE}" ]] ; then
		echo "mismatch: ${FILE}"
		return 1
	else
		echo "match ${FILE}"
	fi
}

check_match tsconfig-common.json
check_match tsconfig-library.json
check_match tsconfig.json
check_match tsconfig-node.json
check_match tslint.json
check_match test/tslint.json
check_match test/mockDom.ts
check_match test/reporter.ts
check_match test/jasmine.js
check_match Makefile
check_match .gitattributes
check_match .travis.yml
check_match LICENSE
check_match .idea/codeStyles/codeStyleConfig.xml
check_match .idea/codeStyles/Project.xml
check_match .idea/inspectionProfiles/Project_Default.xml
check_match .idea/jsLinters/tslint.xml
check_match .idea/compiler.xml
check_match .idea/encodings.xml
check_match .idea/jsLibraryMappings.xml
check_match .idea/misc.xml
check_match .idea/watcherTasks.xml
check_match .gitignore
check_match .npmignore
