#!/usr/bin/env bash

CLI_DIRECTORY="node_modules/@musical-patterns/cli/"

DIR=$(grep -Po '.*(?=\/)' <<< "${FILE}")
[[ ${DIR} != "" ]] && mkdir -p ${DIR}

cp ${CLI_DIRECTORY}${FILE} ${FILE}
