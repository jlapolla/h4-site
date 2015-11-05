# Add project utilities to PATH.
export PATH := $(abspath $(d)bin):$(PATH)

# Directory to deploy to.
export DOC_ROOT := $(d)server

include require.mk
$(call require,$(addsuffix Makefile,$(d)site/))

define $(d)template
.PHONY: $(d)all
$(d)all: $(d)site/all

.PHONY: $(d)clean
$(d)clean: $(d)site/clean
	rm -rf $(DOC_ROOT)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
