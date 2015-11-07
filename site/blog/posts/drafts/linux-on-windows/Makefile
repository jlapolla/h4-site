define $(d)template
$(d)index.html: $(d)main.html $(d)config.yml
	$$(if $(populate_template),,$$(error populate_template function is not defined))
	$(call populate_template,$(d)main.html,/dev/null,$(d)config.yml) >$(d)index.html

.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)index.html
endef

$(eval $($(d)template))
$(eval $(d)template :=)

exports := $(d)index.html
