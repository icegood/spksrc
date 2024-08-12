# Common makefiles
include ../../mk/spksrc.common.mk
include ../../mk/spksrc.directories.mk
include ../../mk/spksrc.filenames.mk

# Force build in native tool directory, not cross directory.
WORK_DIR := $(CURDIR)/work-native

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

####

### Include common rules
include ../../mk/spksrc.common-rules.mk

###
