# Check for blog/ build module
ifeq ($(wildcard $(d)blog/Makefile),) # If blog/ build module does not exist
  # Download blog/ build module
  include exec.mk
  $(call exec,git clone https://github.com/jlapolla/h4-blog.git $(d)blog,Failed to download "$(d)blog/" module)
endif # End check for blog/ build module

# Check for slide-buzz/ build module
ifeq ($(wildcard $(d)slide-buzz/Makefile),) # If slide-buzz/ build module does not exist
  # Download slide-buzz/ build module
  include exec.mk
  $(call exec,git clone https://github.com/jlapolla/h4-slide-skin.git $(d)slide-buzz,Failed to download "$(d)slide-buzz/" module)
endif # End check for slide-buzz/ build module

include require.mk
$(call require,$(addsuffix Makefile,$(d)slide-buzz/))
blog_exports := $(call require,$(addsuffix Makefile,$(d)blog/))

define $(d)template
$(DOC_ROOT)/blog/$(patsubst $(d)blog/%,%,$(1)): $(1)
	mkdir -p $$(dir $$@)
	cp $$< $$@
endef
$(foreach VAR,$(blog_exports),$(eval $(call $(d)template,$(VAR))))
$(eval $(d)template :=)

define $(d)template
include helpdoc.mk

.PHONY: $(d)all
$(d)all: $(addprefix $(DOC_ROOT)/blog/,$(patsubst $(d)blog/%,%,$(blog_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)blog/)
	rm -rf $(DOC_ROOT)/blog/

.DEFAULT_GOAL := help
endef

$(eval $($(d)template))
$(eval $(d)template :=)
