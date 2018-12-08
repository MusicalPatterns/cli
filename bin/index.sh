#!/usr/bin/env sh

export CLI_DIR="./node_modules/@musical-patterns/cli/"
export PATH=${PATH}:./node_modules/.bin/:${CLI_DIR}node_modules/.bin/

CMD="$1"
ARG="$2"
sh ${CLI_DIR}bin/${CMD}.sh "$ARG"
