#!/usr/bin/env bash

export JASMINE_CONFIG_PATH="test/jasmine.js"
export TSCONFIG="tsconfig.node.json"

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${CLI_DIR}${JASMINE_PATH}")

tsc -p ${TSCONFIG}
if [[ $? == 0 ]] ; then
	NODE_ENV=test ts-node -P ${TSCONFIG} ${JASMINE_BINARY}
else
	exit 1
fi
