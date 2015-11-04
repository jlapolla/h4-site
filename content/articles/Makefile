##
# Populate the article page template with contents
#
# USAGE
# $(call populate_template,main.html,head.html,config.yml)
#
# @param $(1) Path to article body partial HTML file
# @param $(2) Path to article head content partial HTML file
# @param $(3) Path to article configuration YAML file
$(eval populate_template = $(abspath populate-template) $(abspath template.html) $$(1) $$(2) $$(3))

include require.mk
article_exports := $(call require,$(addsuffix Makefile,linux-on-windows/))

define $(d)template
$(DIST_DIR)/articles/$(patsubst $(d)%,%,$(1)): $(1)
	mkdir -p $$(dir $$@)
	baseurl $$< /$(PREFIX) > $$@
endef
$(foreach VAR,$(article_exports),$(eval $(call $(d)template,$(VAR))))
$(eval $(d)template :=)

define $(d)template
.PHONY: $(d)all
$(d)all: $(addprefix $(DIST_DIR)/articles/,$(patsubst $(d)%,%,$(article_exports)))

.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,linux-on-windows/)
	rm -rf $(DIST_DIR)/articles
endef

$(eval $($(d)template))
$(eval $(d)template :=)
