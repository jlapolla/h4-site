# Define directories that Make should recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d))
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean

all: $(addsuffix /index.html,$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
