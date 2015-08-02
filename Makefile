# Store include directory in global variable.
export INC_DIR := $(abspath mk)

# Add project utilities to PATH.
export PATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))bin:$(PATH)

# Define directories that Make should recurse into.
RECURSE := content
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean

all: $(addsuffix /all,$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
