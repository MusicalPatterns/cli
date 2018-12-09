#!/usr/bin/env sh

set -e

make test
make lint

VERSION=$(npm version patch)
VERSIONED=$?
if [[ ${VERSIONED} -ne 0 ]] ; then
	printf "This project does not publish itself to npm. "
fi

commit_recursively() {
	git add .
	git commit -m "${VERSION}: ${MSG}"
	git submodule foreach commit_recursively
}
commit_recursively

make push

if [[ ${VERSIONED} -ne 1 ]] ; then
	make publish
fi
