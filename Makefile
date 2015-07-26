DESTDIR ?= /usr/local
BINDIR = ${DESTDIR}/bin

install:
	install -d ${BINDIR}
	install -m 755 bin/litio ${BINDIR}

uninstall:
	rm -f ${BINDIR}/litio

.PHONY: install uninstall
