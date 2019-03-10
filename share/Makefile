SHELL := /bin/bash

MAKEFLAGS += --no-print-directory --always-make

Makefile:
	@:

update:
	bash bin/update.sh

%:
	@musical-patterns-cli $@

-include Makefile.*
