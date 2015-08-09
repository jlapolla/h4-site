# Include common functions.
include $(INC_DIR)/common.mk

VERSION := 15.6.29

clean:
	rm -rf BC3A4B95 vnu.jar*

BC3A4B95:
	$(call GPG_RECV_KEY,$@,$@)

vnu.jar_%-UNVERIFIED.zip:
	$(call DOWNLOAD,https://github.com/validator/validator/releases/download/$*/vnu.jar_$*.zip,$@)

vnu.jar_%.zip.asc:
	$(call DOWNLOAD,https://github.com/validator/validator/releases/download/$*/vnu.jar_$*.zip.asc,$@)

%.zip: %.zip.asc %-UNVERIFIED.zip | BC3A4B95
	gpg --verify $^
	cp $(lastword $^) $@

vnu.jar: vnu.jar_$(VERSION).zip
	unzip -p $< dist/vnu.jar > $@
