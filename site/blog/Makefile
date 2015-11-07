##
# Populate the article page template with contents
#
# USAGE
# $(call populate_template,main.html,head.html,config.yml)
#
# @param main.html  Path to article body partial HTML file
# @param head.html  Path to article head content partial HTML file
# @param config.yml Path to article configuration YAML file
$(eval populate_template = $(d)populate-template $(d)template.html $$(1) $$(2) $$(3))

include require.mk
posts_exports := $(call require,$(addsuffix Makefile,$(d)posts/))

define $(d)template
.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(d)posts/)
endef

$(eval $($(d)template))
$(eval $(d)template :=)

exports := $(posts_exports)
