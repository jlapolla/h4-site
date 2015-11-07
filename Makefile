# Directory to deploy to.
export DOC_ROOT := $(d)server

include require.mk
$(call require,$(addsuffix Makefile,$(d)site/))

include watch.mk
include helpdoc.mk

define $(d)template
$(call helpdoc,$(d)all)
.PHONY: $(d)all
$(d)all: $(d)site/all

$(call helpdoc,$(d)serve,Start a web server to serve build project files from the "$(d)server/" directory)
.PHONY: $(d)serve
$(d)serve:
	exec http-server $(d)server

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean: $(d)site/clean
	rm -rf $(DOC_ROOT)
endef

$(eval $($(d)template))
$(eval $(d)template :=)

.DEFAULT_GOAL := help
