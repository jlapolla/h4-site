# Define directories that Make should recurse into.
RECURSE = articles
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean

all: $(addsuffix /all,$(RECURSE)) $(DIST_DIR)/assets

clean: $(addsuffix /clean,$(RECURSE))

$(DIST_DIR)/assets: $(shell find assets -type f)
	mkdir -p $(@D)
	rm -rf $@
	cp -R assets $@
