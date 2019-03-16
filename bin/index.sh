#!/usr/bin/env bash

export CLI_DIR="./node_modules/@musical-patterns/cli/"
export PATH=${PATH}:./node_modules/.bin/:${CLI_DIR}node_modules/.bin/

CMD="$1"

if [[ -f ${CLI_DIR}bin/${CMD}.sh ]] ; then
	bash ${CLI_DIR}bin/${CMD}.sh
else
	echo "'musical-patterns-cli ${CMD}' is not a defined CLI command. Or you are using a musical-patterns-cli from a foreign PATH and it is not actually installed in your current node_modules. Try running 'which musical-patterns-cli' to see what's up."
fi
