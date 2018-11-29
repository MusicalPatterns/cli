#!/usr/bin/env sh

export JASMINE_CONFIG_PATH=${UTILITIES_DIRECTORY}test/jasmine.json

${UTILITIES_DIRECTORY}cli/share.sh test/tsconfig.json
${UTILITIES_DIRECTORY}cli/share.sh tsconfig-common.json
${UTILITIES_DIRECTORY}cli/share.sh test/mockDom.ts

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${UTILITIES_DIRECTORY}${JASMINE_PATH}")

tsc -p ./test/tsconfig.json
ts-node -P ./test/tsconfig.json ${JASMINE_BINARY}

${UTILITIES_DIRECTORY}cli/unshare.sh test/tsconfig.json
${UTILITIES_DIRECTORY}cli/unshare.sh tsconfig-common.json
${UTILITIES_DIRECTORY}cli/unshare.sh test/mockDom.ts
