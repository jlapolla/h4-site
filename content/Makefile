include require.mk
article_exports := $(call require,$(addsuffix Makefile,$(d)articles/))

define $(d)template
$(DIST_DIR)/articles/$(patsubst $(d)articles/%,%,$(1)): $(1)
	mkdir -p $$(dir $$@)
	baseurl $$< /$(PREFIX) > $$@
endef
$(foreach VAR,$(article_exports),$(eval $(call $(d)template,$(VAR))))
$(eval $(d)template :=)

define $(d)template
$(DIST_DIR)/assets/js/smooth-scroll.js: $(d)assets/js/smooth-scroll.js
	mkdir -p $(DIST_DIR)/assets/js/
	cp $(d)assets/js/smooth-scroll.js $(DIST_DIR)/assets/js/smooth-scroll.js

.PHONY: $(d)all
$(d)all: $(DIST_DIR)/assets/js/smooth-scroll.js $(addprefix $(DIST_DIR)/articles/,$(patsubst $(d)articles/%,%,$(article_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,articles/)
	rm -rf $(DIST_DIR)/articles
endef

$(eval $($(d)template))
$(eval $(d)template :=)
