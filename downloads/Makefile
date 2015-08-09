# Initialize HELP_TEXT.
HELP_TEXT = $(info Targets:)

# Include common functions.
include $(INC_DIR)/common.mk

RECURSE := vnu
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.DEFAULT_GOAL: help

.PHONY: clean help

HELP_TEXT += $(info [clean] Delete all downloaded files.)
clean: $(addsuffix /clean,$(RECURSE))

HELP_TEXT += $(info [help] Display this help text.)
help:
	$(HELP_TEXT)
