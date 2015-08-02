.PHONY: clean

clean:
	rm -rf index.html build

build/check-for-bash.sh: src/check-for-bash.sh
	$(call MKDIR)
	$(call LINK)

index.html: src/main.html build/check-for-bash.html
	static-include $< > $@

include $(INC_DIR)/common.mk
include $(INC_DIR)/syntax.mk
