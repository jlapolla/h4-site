# Copy file.
define COPY
cp $< $@
endef

# Soft link to file.
define LINK
ln -s $(abspath $<) $@
endef

# Make target directory.
# $(call MKDIR)
define MKDIR
@mkdir -p $(@D)
endef
