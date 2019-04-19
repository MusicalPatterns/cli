#!/usr/bin/env bash

if [[ -d test/src ]] ; then
	pushd test/src > /dev/null 2>&1
		NON_TEST_FILES_IN_TEST_SRC=$(find . -type f -not -name "*.test.ts")
		if [[ ${NON_TEST_FILES_IN_TEST_SRC} != "" ]] ; then
			echo "You have some files in your test/src directory which do not have the necessary .test.ts extension and are not being run. Please fix and re-run."
			echo ${NON_TEST_FILES_IN_TEST_SRC}
			exit 1
		fi
	popd > /dev/null 2>&1
fi
if [[ -d test/integration ]] ; then
	pushd test/integration > /dev/null 2>&1
		NON_TEST_FILES_IN_TEST_INTEGRATION=$(find . -type f -not -name "*.test.ts")
		if [[ ${NON_TEST_FILES_IN_TEST_INTEGRATION} != "" ]] ; then
			echo "You have some files in your test/integration directory which do not have the necessary .test.ts extension and are not being run. Please fix and re-run."
			echo ${NON_TEST_FILES_IN_TEST_INTEGRATION}
			exit 1
		fi
	popd > /dev/null 2>&1
fi

export JASMINE_CONFIG_PATH="test/jasmine.js"
export TSCONFIG="tsconfig.node.json"

JASMINE_PATH="node_modules/jasmine/bin/jasmine.js"
test -f "$JASMINE_PATH"
JASMINE_BINARY=$([[ $? == 0 ]] && echo "${JASMINE_PATH}" || echo "${CLI_DIR}${JASMINE_PATH}")

if [[ ${TYPE_CHECK} == "true" ]] ; then
	MAYBE_TRANSPILE_ONLY=""
else
	MAYBE_TRANSPILE_ONLY="--transpile-only"
fi

TIMEFORMAT=%R
TIME_TO_BUILD_SRC=$( { time tsc -p ${TSCONFIG} > /dev/null 2>&1; } 2>&1 )
echo "Compiling the source code for tests took "${TIME_TO_BUILD_SRC}" seconds."
if [[ $? == 0 ]] ; then
	NODE_ENV=test ts-node ${MAYBE_TRANSPILE_ONLY} --files -P ${TSCONFIG} ${JASMINE_BINARY}
else
	exit 1
fi
