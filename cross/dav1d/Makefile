PKG_NAME = dav1d
PKG_VERS = 1.4.2-ice-master
PKG_EXT = tar.gz
PKG_DIST_SITE = https://github.com/icegood/dav1d/archive
PKG_GIT_HASH = 5ef6b241f05a2b9058b58136da4b25842aefba96

PKG_DIST_NAME = $(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_EXTRACT_FILE = $(PKG_NAME)-$(PKG_GIT_HASH)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://www.videolan.org/projects/dav1d.html
COMMENT  = dav1d is a new AV1 cross-platform decoder, open-source, and focused on speed, size and correctness.
LICENSE  = BSD 2-Clause "Simplified" License

UNSUPPORTED_ARCHS = $(ARMv5_ARCHS) $(OLD_PPC_ARCHS)

CONFIGURE_ARGS += -Denable_tests=false
CONFIGURE_ARGS += -Denable_examples=false
CONFIGURE_ARGS += -Denable_docs=false

include ../../mk/spksrc.archs.mk

# Define x86asm
ifeq ($(findstring $(ARCH),$(i686_ARCHS) $(x64_ARCHS)),$(ARCH))
BUILD_DEPENDS = native/nasm
NASM_PATH = $(abspath $(PWD)/../../native/nasm/work-native/install/usr/local/bin)
ENV += AS=$(NASM_PATH)/nasm
ENV += PATH=$(NASM_PATH):$$PATH
CONFIGURE_ARGS += -Denable_asm=true

# Allow ASM on aarch64, disable on all others
else ifeq ($(findstring $(ARCH),$(ARMv8_ARCHS)),$(ARCH))
CONFIGURE_ARGS += -Denable_asm=true
else
CONFIGURE_ARGS += -Denable_asm=false
endif

include ../../mk/spksrc.cross-meson.mk
