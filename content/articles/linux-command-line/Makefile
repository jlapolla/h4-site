include $(INC_DIR)/common.mk

.PHONY: all clean

all: out/main.html out/head.html out/config.yml | assets

clean:
	rm -rf assets build out

build/check-for-bash.sh: src/check-for-bash.sh
	$(call MKDIR)
	$(call LINK)

out/main.html: src/main.html build/check-for-bash.html
	$(call MKDIR)
	static-include $< > $@

out/head.html:
	$(call MKDIR)
	$(call MKFILE)

out/config.yml: src/config.yml
	$(call MKDIR)
	$(call LINK)

assets:
	@mkdir -p $@

include $(INC_DIR)/syntax.mk
