# Build CMake programs
#
# prerequisites:
# - native/module depends on meson + ninja
#

# Common makefiles
include ../../mk/spksrc.common.mk
include ../../mk/spksrc.directories.mk
include ../../mk/spksrc.filenames.mk

# Force build in native tool directrory, not cross directory.
WORK_DIR := $(CURDIR)/work-native

# configure using meson
ifeq ($(strip $(CONFIGURE_TARGET)),)
CONFIGURE_TARGET = meson_configure_target
endif

###

.NOTPARALLEL:

include ../../mk/spksrc.native-env.mk

# meson specific configurations
include ../../mk/spksrc.native-meson-env.mk

# call-up ninja build process
include ../../mk/spksrc.cross-ninja.mk

include ../../mk/spksrc.download.mk

include ../../mk/spksrc.depend.mk

checksum: download
include ../../mk/spksrc.checksum.mk

extract: checksum depend
include ../../mk/spksrc.extract.mk

patch: extract
include ../../mk/spksrc.patch.mk

configure: patch
include ../../mk/spksrc.configure.mk

compile: configure
include ../../mk/spksrc.compile.mk

install: compile
include ../../mk/spksrc.install.mk

.PHONY: cat_PLIST
cat_PLIST:
	@true

all: install

###

### Include common rules
include ../../mk/spksrc.common-rules.mk

###

.PHONY: meson_configure_target

# default meson configure:
meson_configure_target:
	@$(MSG) - Meson configure
	@$(MSG)    - Dependencies = $(DEPENDS)
	@$(MSG)    - Build path = $(WORK_DIR)/$(PKG_DIR)/$(MESON_BUILD_DIR)
	@$(MSG)    - Configure ARGS = $(CONFIGURE_ARGS)
	@$(MSG)    - Install prefix = $(INSTALL_PREFIX)
	@cd $(WORK_DIR)/$(PKG_DIR) && env $(ENV) meson $(MESON_BUILD_DIR) -Dprefix=$(INSTALL_PREFIX) $(CONFIGURE_ARGS) > spk_configure.log 2>&1

###
