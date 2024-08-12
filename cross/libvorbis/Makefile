PKG_NAME = libvorbis
PKG_VERS = 1.3.7
PKG_EXT = tar.gz
PKG_GIT_HASH = 84c023699cdf023a32fa4ded32019f194afcdad0
PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/icegood/vorbis/archive/
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_EXTRACT_FILE = vorbis-$(PKG_GIT_HASH)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libogg

HOMEPAGE = https://xiph.org/vorbis
COMMENT  = Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free, general-purpose compressed audio format for mid to high quality (8kHz-48.0kHz, 16+ bit, polyphonic) audio and music at fixed and variable bitrates from 16 to 128 kbps/channel.
LICENSE  = BSD

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-static

ifeq ($(strip $(GCC_DEBUG_INFO)),1)
  COMPILE_MAKE_OPTIONS = debug
endif

PRE_CONFIGURE_TARGET = libvorbis_pre_configure

include ../../mk/spksrc.cross-cc.mk

.PHONY: libvorbis_pre_configure
libvorbis_pre_configure:
	@$(RUN) ; ./autogen.sh
