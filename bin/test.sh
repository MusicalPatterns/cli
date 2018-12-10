#!/usr/bin/env sh

export JASMINE_CONFIG_PATH=${CLI_DIR}test/jasmine.json

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${CLI_DIR}${JASMINE_PATH}")

tsc -p tsconfig-node.json
if [[ $? == 0 ]] ; then
	ts-node -P tsconfig-node.json ${JASMINE_BINARY}
else
	exit 1
fi
