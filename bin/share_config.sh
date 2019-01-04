#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../.."

make share_file FILE=tsconfig-common.json
make share_file FILE=tsconfig-library.json
make share_file FILE=tsconfig.json
make share_file FILE=tsconfig-node.json
make share_file FILE=tslint.json
make share_file FILE=test/tslint.json
make share_file FILE=test/mockDom.ts
make share_file FILE=test/reporter.ts
make share_file FILE=test/jasmine.js
make share_file FILE=Makefile
make share_file FILE=.gitattributes
make share_file FILE=.travis.yml
make share_file FILE=LICENSE

share_file_with_npm_struggles() {
	FILE="$1"
	cp "${FILE}.for-sharing" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
