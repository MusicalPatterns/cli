#!/usr/bin/env sh

${UTILITIES_DIRECTORY}cli/share.sh tslint.json
${UTILITIES_DIRECTORY}cli/share.sh test/tslint.json
${UTILITIES_DIRECTORY}cli/share.sh lint
${UTILITIES_DIRECTORY}cli/share.sh tsconfig.json
${UTILITIES_DIRECTORY}cli/share.sh tsconfig-common.json
${UTILITIES_DIRECTORY}cli/share.sh test/tsconfig.json

tslint '**/*.ts{,x}' -e **/node_modules/** --fix -p tsconfig.json
tslint 'test/**/*.ts{,x}' --fix -p test/tsconfig.json

${UTILITIES_DIRECTORY}cli/unshare.sh tslint.json
${UTILITIES_DIRECTORY}cli/unshare.sh test/tslint.json
${UTILITIES_DIRECTORY}cli/unshare.sh lint
${UTILITIES_DIRECTORY}cli/unshare.sh tsconfig.json
${UTILITIES_DIRECTORY}cli/unshare.sh tsconfig-common.json
${UTILITIES_DIRECTORY}cli/unshare.sh test/tsconfig.json
