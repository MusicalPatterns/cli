SHELL := /bin/bash

MAKEFLAGS += --no-print-directory --always-make

Makefile:
	@:

update:
	@bash bin/update.sh

%:
	@bash ./node_modules/.bin/musical-patterns-cli $@

-include Makefile.*
