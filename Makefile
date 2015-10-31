# Store include directory in global variable.
export INC_DIR := $(abspath mk)
include $(INC_DIR)/common.mk

# Add project utilities to PATH.
export PATH := $(abspath bin):$(PATH)

# Directory to deploy to.
export DOC_ROOT := $(shell pwd)/server
export PREFIX := blog
export DIST_DIR := $(DOC_ROOT)/$(PREFIX)

HELP_TEXT = $(info Targets:)

# Define directories that Make should recurse into.
RECURSE := content
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))
$(foreach VAR,downloads,$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean help

.DEFAULT_GOAL := help

HELP_TEXT += $(info [all] Build project and deploy to $(DIST_DIR).)
all: $(addsuffix /all,$(RECURSE))

HELP_TEXT += $(info [clean] Delete built files, leaving only source files.)
clean: $(addsuffix /clean,$(RECURSE))
	rm -rf $(DOC_ROOT)

HELP_TEXT += $(info [check] Check deployed files. Be sure to build [all] first.)
check: $(patsubst $(DIST_DIR)/%,$(DIST_DIR)/check/%,$(shell find $(DIST_DIR) -path $(DIST_DIR)/check -prune -o -type f -name '*.html' -print))

HELP_TEXT += $(info [check-clean] Delete results of last [check].)
check-clean:
	rm -rf $(DIST_DIR)/check

HELP_TEXT += $(info [help] Display this help text.)
help:
	$(HELP_TEXT)

$(DIST_DIR)/check/%.html: $(DIST_DIR)/%.html
	$(call MKDIR)
	(test-html5 $< && touch $@) || \
	(validate-html5 $< 1>$@ 2>&1; \
	printf '%s\n' '<li><a href="$(patsubst $(DOC_ROOT)/%,/%,$<)">Original file</a> [<a href="$(patsubst $(DOC_ROOT)/%,/%,$@)">Error report</a>] - $<</li>' >> $(DIST_DIR)/check/report.html)
