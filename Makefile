SHELL := /bin/bash

MAKEFLAGS += --no-print-directory --always-make

Makefile:
	@:

build:
	@tsc lint/*.ts > /dev/null 2>&1 || true

build-local:
	@:

commit:
	@bin/commit.sh

fast-ship:
	@bin/fast-ship.sh

lint:
	@:

publish:
	@bin/publish.sh

pull:
	@bin/pull.sh

push:
	@bin/push.sh

run:
	@:

ship:
	@bin/ship.sh

switch-back-to-remote:
	@:

test:
	@:

update:
	@:
