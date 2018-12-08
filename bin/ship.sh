#!/usr/bin/env sh

set -e

make test
make lint

VERSION=$(npm version patch)
VERSIONED=$?
if [[ ${VERSIONED} -ne 0 ]] ; then
	printf "This project does not publish itself to npm. "
fi

git submodule foreach git add .
git submodule foreach git commit -m "${VERSION}: ${MSG}"
git add .
git commit -m "${VERSION}: ${MSG}"
make push

if [[ ${VERSIONED} -ne 1 ]] ; then
	make publish
fi
