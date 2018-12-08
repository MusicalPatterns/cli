#!/usr/bin/env sh

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../../"

function share_file {
	FILE="$1"
	cp ${FILE} ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

share_file tsconfig-common.json
share_file tsconfig-library.json
share_file tsconfig.json
share_file tsconfig-node.json
share_file tslint.json
share_file test/tslint.json
share_file test/mockDom.ts
share_file test/jasmine.json
share_file Makefile
