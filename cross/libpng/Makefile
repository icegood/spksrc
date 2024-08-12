PKG_NAME = libpng
PKG_VERS = icegood_master
PKG_EXT = tar.gz
PKG_GIT_HASH = 3463962f9158873d23de9abc178ad608a5e1a165
PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/icegood/libpng/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_GIT_HASH)

DEPENDS = cross/zlib

HOMEPAGE = http://www.libpng.org/pub/png/libpng.html
COMMENT  = Portable Network Graphics Library
LICENSE  = http://www.libpng.org/pub/png/src/libpng-LICENSE.txt

CMAKE_ARGS += -DPNG_STATIC=OFF
ADDITIONAL_CFLAGS = -O -lm

include ../../mk/spksrc.cross-cmake.mk
