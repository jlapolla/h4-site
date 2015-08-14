HELP_TEXT = $(info Targets:)

include $(INC_DIR)/common.mk

# Collect list of article directories to recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d))

.DEFAULT_GOAL := help

.PHONY: all clean help

HELP_TEXT += $(info [all] Build and deploy all articles.)
all: $(addsuffix /all,$(RECURSE)) $(addsuffix /index.html,$(addprefix $(DIST_DIR)/articles/,$(RECURSE)))

HELP_TEXT += $(info [clean] Remove build artifacts, including deployed articles.)
clean: $(addsuffix /clean,$(RECURSE))
	rm -rf $(DIST_DIR)/articles

HELP_TEXT += $(info [help] Display this help text.)
help:
	$(HELP_TEXT)

# Rules to deploy articles.
$(DIST_DIR)/articles/%/index.html: %/out/main.html %/out/head.html | %/assets
	$(call MKDIR)
	./static-make-article static-template.html $< > $@

$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))
