#!/usr/bin/env bash

ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES="../../.."
CLI_DIRECTORY="node_modules/@musical-patterns/cli/"

pushd ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}
	FILE=tsconfig-common.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=tsconfig-library.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=tsconfig.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=tsconfig-node.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=tslint.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=test/tslint.json ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=test/mockDom.ts ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=test/reporter.ts ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=test/jasmine.js ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=Makefile ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=.gitattributes ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=.travis.yml ${CLI_DIRECTORY}/bin/share_file.sh
	FILE=LICENSE ${CLI_DIRECTORY}/bin/share_file.sh
popd

share_file_with_npm_struggles() {
	FILE="$1"
	cp "${FILE}.for-sharing" ${ESCAPE_CLI_DIRECTORY_IN_PARENTS_NODE_MODULES}${FILE}
}

share_file_with_npm_struggles .gitignore
share_file_with_npm_struggles .npmignore
