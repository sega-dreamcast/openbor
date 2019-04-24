#!/usr/bin/env bash

# Parameters
VERSION_BUILD="4111"

OUTPUT_PATH="bin"
SOURCE_PATH="engine"

VERSION_FILE="version.h"
ELF_FILE="OpenBOR.elf"
BIN_FILE="OpenBOR.bin"

# Set the working directory
cd "$SOURCE_PATH"

# Check for version.h file
# As the original "version.sh" script is executed from SVN, the VERSION_BUILD is
# always empty and we don't want to update this script for now...
if [ ! -f "version.h" ]; then
  ./version.sh
  
  # Avoid the -i switch as this causes problems under MinGW.
  # See https://stackoverflow.com/a/14410957/3726096
  sed "s/\VERSION_BUILD \"\"/VERSION_BUILD \"$VERSION_BUILD\"/g" "$VERSION_FILE" > "$VERSION_FILE".tmp
  mv "$VERSION_FILE".tmp "$VERSION_FILE"
fi

# Building the Sega Dreamcast binary
make clean BUILD_DC=1
make BUILD_DC=1

# Back to our original location
cd ..

# Moving binaries in the "bin/" directory if possible
if [ -f "$SOURCE_PATH/$ELF_FILE" ]; then
  if [ ! -d "$OUTPUT_PATH" ]; then
    mkdir "$OUTPUT_PATH"
  fi
  mv "$SOURCE_PATH/$ELF_FILE" "$OUTPUT_PATH"
  mv "$SOURCE_PATH/$BIN_FILE" "$OUTPUT_PATH"
fi
