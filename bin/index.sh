#!/usr/bin/env sh

export CLI_DIR="./node_modules/@musical-patterns/cli/"
export PATH=${PATH}:./node_modules/.bin/:${CLI_DIR}node_modules/.bin/

CMD="$1"
ARG="$2"

if [[ -f ${CLI_DIR}bin/${CMD}.sh ]] ; then
	sh ${CLI_DIR}bin/${CMD}.sh "$ARG"
else
	echo "'musical-patterns ${CMD}' is not a defined CLI command."
fi
