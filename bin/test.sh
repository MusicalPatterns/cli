#!/usr/bin/env bash

if [[ ${PATTERN} == "" || ${PATTERN} == "ALL" ]] ; then
	export JASMINE_CONFIG_PATH="${CLI_DIR}test/jasmine.js"
	export TSCONFIG="tsconfig-node.json"
else
	export JASMINE_CONFIG_PATH="src/${PATTERN}/test/jasmine.js"
	export TSCONFIG="src/${PATTERN}/tsconfig.json"
fi

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${CLI_DIR}${JASMINE_PATH}")

tsc -p ${TSCONFIG}
if [[ $? == 0 ]] ; then
	ts-node -P ${TSCONFIG} ${JASMINE_BINARY}
else
	exit 1
fi
