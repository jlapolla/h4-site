# Define directories that Make should recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d ! -name build))

.PHONY: all clean

all: $(addsuffix /all,$(RECURSE)) $(addsuffix /index.html,$(DIST_DIR)/articles/$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
	rm -rf build $(DIST_DIR)/articles

# Rules to make pages from article partials.
build/%/index.html: %/build/main.html
	$(call MKDIR)
	./static-make-article static-template.html $< > $@

# Let articles handle building their own components by default.
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) DIST_DIR=$$(DIST_DIR)/articles/$(1) $$*
endef
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))

# Rules for making index.html files in $(DIST_DIR).
$(DIST_DIR)/articles/%/index.html: build/%/index.html
	$(call MKDIR)
	$(call COPY)

include $(INC_DIR)/common.mk
