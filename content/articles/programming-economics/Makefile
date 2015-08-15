include $(INC_DIR)/common.mk

.PHONY: all clean

all: out/main.html out/head.html out/config.yml | assets

clean:
	rm -rf assets build out

out/main.html: src/main.html
	$(call MKDIR)
	$(call LINK)

out/head.html:
	$(call MKDIR)
	$(call MKFILE)

out/config.yml: src/config.yml
	$(call MKDIR)
	$(call LINK)

assets:
	@mkdir -p $@
