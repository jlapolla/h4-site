include require.mk
all_exports := $(call require,$(addsuffix Makefile,$(wildcard $(d)drafts/*/) $(wildcard $(d)published/*/)))

define $(d)template
.PHONY: $(d)clean
$(d)clean: $(addsuffix clean,$(wildcard $(d)drafts/*/) $(wildcard $(d)published/*/))
endef

$(eval $($(d)template))
$(eval $(d)template :=)

exports := $(all_exports)
