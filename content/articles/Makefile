include $(INC_DIR)/common.mk

# Define directories that Make should recurse into.
RECURSE = $(patsubst ./%,%,$(shell find . -mindepth 1 -maxdepth 1 -type d ! -name build))

.PHONY: all clean

all: $(addsuffix /all,$(RECURSE)) $(addsuffix /index.html,$(DIST_DIR)/articles/$(RECURSE))

clean: $(addsuffix /clean,$(RECURSE))
	rm -rf build $(DIST_DIR)/articles

# Rules to make article pages from article partials.
$(DIST_DIR)/articles/%/index.html: %/build/main.html
	$(call MKDIR)
	./static-make-article static-template.html $< > $@

# Let articles handle building their own components by default.
$(foreach VAR,$(RECURSE),$(eval $(call RECURSE_TEMPLATE,$(VAR))))
