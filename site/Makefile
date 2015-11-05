include require.mk
article_exports := $(call require,$(addsuffix Makefile,$(d)blog/))

define $(d)template
$(DOC_ROOT)/blog/$(patsubst $(d)blog/%,%,$(1)): $(1)
	mkdir -p $$(dir $$@)
	cp $$< $$@
endef
$(foreach VAR,$(article_exports),$(eval $(call $(d)template,$(VAR))))
$(eval $(d)template :=)

define $(d)template
$(DOC_ROOT)/assets/js/smooth-scroll.js: $(d)assets/js/smooth-scroll.js
	mkdir -p $(DOC_ROOT)/assets/js/
	cp $(d)assets/js/smooth-scroll.js $(DOC_ROOT)/assets/js/smooth-scroll.js

.PHONY: $(d)all
$(d)all: $(DOC_ROOT)/assets/js/smooth-scroll.js $(addprefix $(DOC_ROOT)/blog/,$(patsubst $(d)blog/%,%,$(article_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)blog/)
	rm -rf $(DOC_ROOT)/blog/
endef

$(eval $($(d)template))
$(eval $(d)template :=)
