# Check for blog/ build module
ifeq ($(wildcard $(d)blog/Makefile),) # If blog/ build module does not exist
  # Download blog/ build module
  include exec.mk
  $(call exec,git clone https://github.com/jlapolla/h4-blog.git $(d)blog,Failed to download "$(d)blog/" module)
endif # End check for blog/ build module

# Check for slide-buzz/linux-on-windows/ module
ifeq ($(wildcard $(d)slide-buzz/linux-on-windows/index.html),) # If module does not exist
  # Download module
  include exec.mk
  $(call exec,git clone https://github.com/jlapolla/h4-slide-content.git $(d)slide-buzz/linux-on-windows/,Failed to download "$(d)slide-buzz/linux-on-windows/" module)
endif # End check for slide-buzz/linux-on-windows/ module

# Check for slide-buzz/resume/ module
ifeq ($(wildcard $(d)slide-buzz/resume/index.html),) # If module does not exist
  # Download module
  include exec.mk
  $(call exec,git clone https://github.com/jlapolla/resume.git $(d)slide-buzz/resume/,Failed to download "$(d)slide-buzz/resume/" module)
endif # End check for slide-buzz/resume/ module

include require.mk
blog_exports := $(call require,$(addsuffix Makefile,$(d)blog/))
slide_buzz_exports := $(shell find $(d)slide-buzz/ -path '*/.git/*' -prune -o -type f ! -name '.*' -print)

define $(d)template
$(DOC_ROOT)/$(patsubst $(d)%,%,$(1)): $(1)
	mkdir -p $$(dir $$@)
	cp $$< $$@
endef
$(foreach VAR,$(blog_exports) $(slide_buzz_exports),$(eval $(call $(d)template,$(VAR))))
$(eval $(d)template :=)

define $(d)template
include helpdoc.mk

.PHONY: $(d)all
$(d)all: $(addprefix $(DOC_ROOT)/,$(patsubst $(d)%,%,$(blog_exports) $(slide_buzz_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)blog/)
	rm -rf $(DOC_ROOT)/blog/ $(DOC_ROOT)/slide-buzz/

.DEFAULT_GOAL := help
endef

$(eval $($(d)template))
$(eval $(d)template :=)
