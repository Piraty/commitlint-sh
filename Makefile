PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
DESTDIR ?=


all:

install:
	install -Dm0755 commitlint $(DESTDIR)$(BINDIR)/commitlint

lint:
	shellcheck commitlint
	shfmt -d -p -ci commitlint

dogfood:
	for githash in $$(git log --no-patch --pretty='format:%H'); do \
		git show --no-patch --pretty='format:%s' $$githash | ./commitlint \
	; done

unittest:
	sh ./test

check: unittest lint dogfood


.PHONY: all check dogfood install lint unittest
