PKG_NAME = zimg
PKG_VERS = ice_master_debug
PKG_EXT = tar.gz
PKG_GIT_HASH = 81fda9f6820801d04e2dbc364f19347a71581553
PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/icegood/zimg/archive
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)

PKG_EXTRACT_FILE = $(PKG_NAME)-$(PKG_GIT_HASH)
PKG_DIR = $(PKG_NAME)-debug-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/sekrit-twc/zimg
COMMENT  = The "z" library implements the commonly required image processing basics of scaling, colorspace conversion, and depth conversion.
LICENSE  = WTFPL license

UNSUPPORTED_ARCHS = $(OLD_PPC_ARCHS) $(ARMv5_ARCHS)

GNU_CONFIGURE = 1
PRE_CONFIGURE_TARGET = zimg_pre_configure

include ../../mk/spksrc.cross-cc.mk

ifeq ($(call version_lt, $(TCVERSION), 7.0),1)
ifeq ($(findstring $(ARCH),$(ARMv8_ARCHS)),$(ARCH))
CONFIGURE_ARGS += --disable-simd
endif
endif

.PHONY: zimg_pre_configure
zimg_pre_configure:
	@$(RUN) ./autogen.sh
