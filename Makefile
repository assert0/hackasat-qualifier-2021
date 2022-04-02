SUBDIRS := $(wildcard */.)

all: $(SUBDIRS)
$(SUBDIRS): generator-base
#	$(MAKE) -C $@ build
	@echo $@

.PHONY: all $(SUBDIRS) generator-base

generator-base:
	$(MAKE) -C $@ base
