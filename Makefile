PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
DESTDIR ?=


GITREVS = $(shell git log --no-patch --pretty='format:%H')


all:

install:
	install -Dm0755 commitlint $(DESTDIR)$(BINDIR)/commitlint

lint:
	shellcheck commitlint
	shfmt -d -p -ci commitlint

lint-%:
	git show --no-patch --pretty='format:%s' $(*) | ./commitlint

dogfood: $(foreach rev,$(GITREVS),lint-$(rev))


unittest:
	sh ./test

check: unittest lint dogfood


.PHONY: all check dogfood install lint unittest
