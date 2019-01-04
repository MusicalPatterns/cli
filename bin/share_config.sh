#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../.."

FILE=tsconfig-common.json ./bin/share_file.sh
FILE=tsconfig-library.json ./bin/share_file.sh
FILE=tsconfig.json ./bin/share_file.sh
FILE=tsconfig-node.json ./bin/share_file.sh
FILE=tslint.json ./bin/share_file.sh
FILE=test/tslint.json ./bin/share_file.sh
FILE=test/mockDom.ts ./bin/share_file.sh
FILE=test/reporter.ts ./bin/share_file.sh
FILE=test/jasmine.js ./bin/share_file.sh
FILE=Makefile ./bin/share_file.sh
FILE=.gitattributes ./bin/share_file.sh
FILE=.travis.yml ./bin/share_file.sh
FILE=LICENSE ./bin/share_file.sh

share_file_with_npm_struggles() {
	FILE="$1"
	cp "${FILE}.for-sharing" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
