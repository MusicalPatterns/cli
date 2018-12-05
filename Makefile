.PHONY: lint
.PHONY: test

build:
	@:

lint:
	@:

publish:
	npm publish --access public

push:
	git push

ship:
	sh ./cli/ship.sh

test:
	@:
