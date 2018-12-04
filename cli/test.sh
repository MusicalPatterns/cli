#!/usr/bin/env sh

export JASMINE_CONFIG_PATH=${UTILITIES_DIRECTORY}test/jasmine.json

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${UTILITIES_DIRECTORY}${JASMINE_PATH}")

tsc -p ./test/tsconfig.json
if [[ $? == 0 ]] ; then
	ts-node -P ./test/tsconfig.json ${JASMINE_BINARY}
fi
