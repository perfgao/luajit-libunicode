PREFIX=/usr/local
LMODNAME=libunicode.lua

LUA=luajit
LMODFILE=$(LMODNAME)
LMODPATH=src/$(LMODFILE)

ABIVER=5.1
INSTALL_SHARE=$(PREFIX)/share
INSTALL_LMOD=$(INSTALL_SHARE)/lua/$(ABIVER)

all:
	@echo "This is a pure module. Nothing to make :)"
	@echo "use 'make install' to install libunicode.lua"
	@echo "use 'make uninstall' to uninstall libunicode.lua"
	@echo "libunicode.lua will install" ${INSTALL_LMOD}/${LMODFILE}

install:
	install -m0644 $(LMODPATH) $(INSTALL_LMOD)/$(LMODFILE)

test:
	${LUA} test/test.lua

uninstall:
	rm -f $(INSTALL_LMOD)/$(LMODFILE)
