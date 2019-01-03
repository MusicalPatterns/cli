#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

share_file() {
	FILE="$1"
	cp ${FILE} ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

mkdir -p ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}test

share_file tsconfig-common.json
share_file tsconfig-library.json
share_file tsconfig.json
share_file tsconfig-node.json
share_file tslint.json
share_file test/tslint.json
share_file test/mockDom.ts
share_file test/reporter.ts
share_file test/jasmine.js
share_file Makefile
share_file .gitattributes
share_file .travis.yml
share_file LICENSE

share_file_with_npm_struggles() {
	FILE="$1"
	cp "${FILE}.for-sharing" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
