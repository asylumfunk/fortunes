#!/usr/bin/make -f

# Copyright (C) 2014 asylumfunk
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You may obtain a copy of this license at:
#   http://www.gnu.org/licenses/gpl-3.0.html

SHELL=/bin/sh
STRFILE=strfile
STRFILEFLAGS=-c '%'

SRC_DIR=./src
SRCS=$(filter-out $(SRC_DIR)/README, $(wildcard $(SRC_DIR)/*))

OBJ_DIR=./build
OBJ_EXT=dat
OBJS=$(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%.$(OBJ_EXT),$(SRCS))

DIST_DIR=fortunes
DIST_EXT=.tar.gz
DIST_OBJ=$(DIST_DIR)$(DIST_EXT)
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
	make INSTALL_PATH=$(DIST_DIR) install
	tar $(TARFLAGS) -f $(DIST_OBJ) $(DIST_DIR)
	rm -fr $(DIST_DIR)

distclean: clean
	rm -f $(DIST_OBJ)

install: $(OBJS)
	$(INSTALL_DIR) $(INSTALL_PATH)
	$(INSTALL_DATA) $(SRCS) $(OBJS) $(INSTALL_PATH)

uninstall:
	rm -f $(addprefix $(INSTALL_PATH)/, $(notdir $(SRCS) $(OBJS)))

