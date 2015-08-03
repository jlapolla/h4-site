.PHONY: all clean

all:

clean:
	rm -rf build

build/check-for-bash.sh: src/check-for-bash.sh
	$(call MKDIR)
	$(call LINK)

build/main.html: src/main.html build/check-for-bash.html
	$(call MKDIR)
	static-include $< > $@

include $(INC_DIR)/common.mk
include $(INC_DIR)/syntax.mk
