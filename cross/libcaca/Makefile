PKG_NAME = libcaca
PKG_VERS = 0.99.ice
# Require autoconf >= 2.71
#PKG_VERS = 0.99.beta20
PKG_EXT = tar.gz
PKG_DIST_SITE = https://github.com/icegood/libcaca/archive
PKG_GIT_HASH = bccb83e113d0e0b62bbd0ff2759670b84c2400d5

PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_EXTRACT_FILE = $(PKG_NAME)-$(PKG_GIT_HASH)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/imlib2

HOMEPAGE = http://caca.zoy.org/
COMMENT  = The industry-standard colour ASCII-art library.
LICENSE  = WTFPL

GNU_CONFIGURE = 1
PRE_CONFIGURE_TARGET = libcaca_pre_configure
CONFIGURE_ARGS = --disable-python

include ../../mk/spksrc.cross-cc.mk

.PHONY: libcaca_pre_configure
libcaca_pre_configure:
	$(RUN) ; ./bootstrap
