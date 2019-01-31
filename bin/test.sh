#!/usr/bin/env bash

export JASMINE_CONFIG_PATH="test/jasmine.js"
export TSCONFIG="tsconfig.node.json"

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${CLI_DIR}${JASMINE_PATH}")

TIMEFORMAT=%R
TIME_TO_BUILD_SRC=$( { time tsc -p ${TSCONFIG} > /dev/null 2>&1; } 2>&1 )
echo "Building the source code for tests took "${TIME_TO_BUILD_SRC}" seconds."
if [[ $? == 0 ]] ; then
	NODE_ENV=test ts-node -P ${TSCONFIG} ${JASMINE_BINARY}
else
	exit 1
fi
