# Store include directory in global variable.
export INC_DIR := $(abspath mk)

# Add project utilities to PATH.
export PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))bin:$(PATH)

# Directory to deploy to.
export DIST_DIR := /usr/local/apache2/htdocs/blog2

HELP_TEXT = $(info Targets:)

# Define directories that Make should recurse into.
RECURSE := content
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean help

.DEFAULT_GOAL := help

all: $(addsuffix /all,$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
	rm -rf $(DIST_DIR)

HELP_TEXT += $(info [check] Run validators and linters on files deployed in the distribution directory.)
check:
	vnu --skip-non-html $(DIST_DIR)

HELP_TEXT += $(info [help] Display this help text.)
help:
	$(HELP_TEXT)
