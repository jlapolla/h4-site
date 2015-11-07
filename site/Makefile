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
.PHONY: $(d)all
$(d)all: $(addprefix $(DOC_ROOT)/blog/,$(patsubst $(d)blog/%,%,$(article_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)blog/)
	rm -rf $(DOC_ROOT)/blog/
endef

$(eval $($(d)template))
$(eval $(d)template :=)
