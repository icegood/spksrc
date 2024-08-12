PKG_NAME = libtheora
PKG_VERS = 1.1.master-ice
PKG_EXT = tar.gz
PKG_GIT_HASH = 7180717276af1ebc7da15c83162d6c5d6203aabf
PKG_DIST_SITE = https://github.com/icegood/theora/archive
PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_EXTRACT_FILE = theora-$(PKG_GIT_HASH)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libogg cross/libvorbis

HOMEPAGE = https://www.theora.org/
COMMENT  = Theora is a free and open video compression format from the Xiph.org Foundation.
LICENSE  = BSD-Style

GNU_CONFIGURE = 1

CONFIGURE_ARGS  = --disable-static
CONFIGURE_ARGS += --disable-examples
CONFIGURE_ARGS += --disable-spec

ifeq ($(strip $(GCC_DEBUG_INFO)),1)
  COMPILE_MAKE_OPTIONS = debug
endif
PRE_CONFIGURE_TARGET = libtheora_pre_configure

include ../../mk/spksrc.cross-cc.mk

.PHONY: libtheora_pre_configure
libtheora_pre_configure:
	@$(RUN) ; ./autogen.sh
