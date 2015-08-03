# Define directories that Make should recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d ! -name build))

.PHONY: all clean

all: $(addsuffix /all,$(RECURSE)) $(addsuffix /index.html,$(DIST_DIR)/articles/$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
	rm -rf build $(DIST_DIR)/articles

# Rules to make pages from article partials.
define INDEX_TEMPLATE
build/$(1)/index.html: $(1)/build/main.html
	$$(call MKDIR)
	./static-make-article static-template.html $$< > $$@
endef
$(foreach VAR,$(RECURSE),$(eval $(call INDEX_TEMPLATE,$(VAR))))

# Let articles handle building their own components by default.
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) DIST_DIR=$$(DIST_DIR)/articles/$(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

# Rules for making index.html files in $(DIST_DIR).
define DIST_TEMPLATE
$$(DIST_DIR)/articles/$(1)/index.html: build/$(1)/index.html
	$$(call MKDIR)
	$$(call COPY)
endef
$(foreach VAR,$(RECURSE),$(eval $(call DIST_TEMPLATE,$(VAR))))

include $(INC_DIR)/common.mk
