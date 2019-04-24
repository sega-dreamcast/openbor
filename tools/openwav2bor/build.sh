#!/bin/sh
# Compiles openwav2bor and openbor2wav for the following platforms...
# Windows (MinGW), Mac OS X and Linux

TARGET_PLATFORM=$1
HOST_PLATFORM=$(uname -s)

if [ $# -ne 1 ]; then
  echo "Usage: '`basename $0` mac' == Mac OS X"
  echo "\t\t win  == Windows"
  echo "\t\t lin  == Linux"
  exit 1
fi

# Target is Windows
if [ "`echo $TARGET_PLATFORM | grep 'win'`" ]; then
  EXTENSION=".exe"
  if [ "`echo $HOST_PLATFORM | grep 'Darwin'`" ]; then
    CC="i386-mingw32-"
    PATH="$PATH:/usr/local/i386-mingw32-4.3.0/bin"
  elif [ "`echo $HOST_PLATFORM | grep 'Linux'`" ]; then
    CC="i586-mingw32msvc-"
  fi
fi

# Target is Linux
if [ "`echo $TARGET_PLATFORM | grep 'lin'`" ]; then
  if [ "`echo $HOST_PLATFORM | grep 'Darwin'`" ]; then
    CC="i386-linux-"
    PATH="$PATH:/usr/local/i386-linux-4.1.1/bin"
  fi
fi

# Target is Mac OS X
if [ "`echo $TARGET_PLATFORM | grep 'mac'`" ]; then
  if [ "`echo $HOST_PLATFORM | grep 'Darwin'`" ]; then
    CFLAGS="$CFLAGS -arch x86_64 -arch i386 -arch ppc"
  fi
fi

CC=${CC}"gcc"
RM="rm -rf"
CFLAGS="$CFLAGS -I source"

build() {
	TARGET=$1
	SOURCE="source/$TARGET.c source/adpcm.c"

	$RM $TARGET$EXTENSION *.o
	$CC $CFLAGS -o $TARGET$EXTENSION $SOURCE
}

build wav2bor
build bor2wav


