# include this file to install native package without building from source
# adjusted for native packages based on spksrc.install-resources.mk
#
# native packages using this have to:
# - implement a custom INSTALL_TARGET to copy the required files to the 
#   target location under $(STAGING_INSTALL_PREFIX)

# Common makefiles
include ../../mk/spksrc.common.mk
include ../../mk/spksrc.directories.mk
include ../../mk/spksrc.filenames.mk

# Force build in native tool directory, not cross directory.
WORK_DIR := $(CURDIR)/work-native

ifneq ($(REQUIRE_KERNEL),)
  @$(error native-install cannot be used when REQUIRE_KERNEL is set)
endif

#####

.NOTPARALLEL:

include ../../mk/spksrc.native-env.mk

include ../../mk/spksrc.download.mk

include ../../mk/spksrc.depend.mk

checksum: download
include ../../mk/spksrc.checksum.mk

extract: checksum depend
include ../../mk/spksrc.extract.mk

patch: extract
include ../../mk/spksrc.patch.mk

install: patch
include ../../mk/spksrc.install.mk

ifeq ($(strip $(PLIST_TRANSFORM)),)
PLIST_TRANSFORM= cat
endif

.PHONY: cat_PLIST
cat_PLIST:
	@true

all: install

####

### Include common rules
include ../../mk/spksrc.common-rules.mk

###
