HELP_TEXT = $(info Targets:)

include $(INC_DIR)/common.mk

# Collect list of article directories to recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d))

.DEFAULT_GOAL := help

.PHONY: all clean help

HELP_TEXT += $(info [all] Build and deploy all articles.)
all: $(addsuffix /all,$(RECURSE)) $(foreach VAR,/index.html /assets,$(addsuffix $(VAR),$(addprefix $(DIST_DIR)/articles/,$(RECURSE))))

HELP_TEXT += $(info [clean] Remove build artifacts, including deployed articles.)
clean: $(addsuffix /clean,$(RECURSE))
	rm -rf $(DIST_DIR)/articles

HELP_TEXT += $(info [help] Display this help text.)
help:
	$(HELP_TEXT)

# Template population.
$(DIST_DIR)/articles/%/index.html: %/out/main.html %/out/head.html %/out/config.yml static-template.html | %/assets
	$(call MKDIR)
	./static-make-article static-template.html $^ > $@

define TEMPLATE
$$(DIST_DIR)/articles/$(1)/assets: $$(shell find $(1)/assets -type f)
	$$(call MKDIR)
	@rm -rf $$@
	cp -R $(1)/assets $$@
endef
$(foreach VAR,$(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d)),$(eval $(call TEMPLATE,$(VAR))))

$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))
