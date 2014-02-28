#!/usr/bin/make -f

SHELL=/bin/sh
STRFILE=strfile
STRFILEFLAGS=-c '%'

SRC_DIR=./src
SRCS=$(filter-out $(SRC_DIR)/README, $(wildcard $(SRC_DIR)/*))

OBJ_DIR=./build
OBJ_EXT=dat
OBJS=$(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%.$(OBJ_EXT),$(SRCS))

DIST_DIR=fortunes
DIST_OBJ=$(DIST_DIR).tar.gz
TARFLAGS=-vca

prefix=/usr
datarootdir=$(prefix)/share
INSTALL=install
INSTALL_DATA = $(INSTALL) -m644
INSTALL_DIR = $(INSTALL) -d
INSTALL_PATH=$(DESTDIR)$(datarootdir)/games/fortunes

.PHONY: all clean dist distclean install uninstall

all: $(OBJS)
$(OBJS): | $(OBJ_DIR)
$(OBJ_DIR):
	mkdir $(OBJ_DIR)
$(OBJ_DIR)/%.$(OBJ_EXT): $(SRC_DIR)/%
	$(STRFILE) $(STRFILEFLAGS) $< $@

clean:
	rm -fr $(OBJ_DIR)

dist: $(DIST_OBJ)
$(DIST_OBJ): $(OBJS)
	mkdir $(DIST_DIR)
	cp -t $(DIST_DIR) $(SRCS) $(OBJS)
	tar $(TARFLAGS) -f $(DIST_OBJ) $(DIST_DIR)
	rm -fr $(DIST_DIR)

distclean: clean
	rm -f $(DIST_OBJ)

install: $(OBJS)
	$(INSTALL_DIR) $(INSTALL_PATH)
	$(INSTALL_DATA) $(SRCS) $(OBJS) $(INSTALL_PATH)

uninstall:
	rm -f $(addprefix $(INSTALL_PATH)/, $(notdir $(SRCS) $(OBJS)))

