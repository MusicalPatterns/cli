#!/usr/bin/env sh

export UTILITIES_DIRECTORY="./node_modules/@musical-patterns/cli/"
export PATH=${PATH}:./node_modules/.bin/:${UTILITIES_DIRECTORY}node_modules/.bin/

CMD="$1"
ARG="$2"
sh ${UTILITIES_DIRECTORY}cli/${CMD}.sh "$ARG"
