# Define directories that Make should recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d ! -name build))

define INDEX_TEMPLATE
build/$(1)/index.html: $(1)/main.html
	$$(call MKDIR)
	./static-make-article static-template.html $$< > $$@
endef
$(foreach VAR,$(RECURSE),$(eval $(call INDEX_TEMPLATE,$(VAR))))

define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

.PHONY: all clean

all: $(addsuffix /index.html,build/$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
	rm -rf build

include $(INC_DIR)/common.mk
