##
# Populate the article page template with contents
#
# USAGE
# $(call populate_template,main.html,head.html,config.yml)
#
# @param $(1) Path to article body partial HTML file
# @param $(2) Path to article head content partial HTML file
# @param $(3) Path to article configuration YAML file
$(eval populate_template = $(abspath $(d)populate-template) $(abspath $(d)template.html) $$(1) $$(2) $$(3))

include require.mk
article_exports := $(call require,$(addsuffix Makefile,$(d)linux-on-windows/))

define $(d)template
.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)linux-on-windows/)
endef

$(eval $($(d)template))
$(eval $(d)template :=)

exports := $(article_exports)
