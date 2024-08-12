#!/bin/bash
make V=1 ARCH=armada370 TCVERSION=7.1 -f ../../cross/ffmpeg6/Makefile smart-clean
make V=1 ARCH=armada370 TCVERSION=7.1 -f ../../cross/"$1"/Makefile smart-clean
make spkclean
