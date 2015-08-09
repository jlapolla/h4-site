# Copy first prerequisite to target destination.
# $(call COPY)
define COPY
cp $< $@
endef

# Download file from URL. Delete the file if download failed.
# $(call DOWNLOAD,url,file_name)
define DOWNLOAD
curl -sLfo $(2) $(1) || (rm -f $(2) && exit 1)
endef

# Download GPG key. Optionally export downloaded key to file.
# $(call GPG_RECV_KEY,key_id,[file_name])
define GPG_RECV_KEY
gpg --keyserver keys.gnupg.net --recv-keys $(1)
$(if $(2),gpg -ao $(2) --export $(1))
endef

# Soft link target to prerequisite.
# $(call LINK)
define LINK
ln -s $(abspath $<) $@
endef

# Make target directory.
# $(call MKDIR)
define MKDIR
@mkdir -p $(@D)
endef

# Call make recursively for files in a directory.
# $(eval $(call RECURSE_TEMPLATE,dir_name))
define RECURSE_TEMPLATE
$(1)/%:
	$$(MAKE) -C $(1) $$*
endef
