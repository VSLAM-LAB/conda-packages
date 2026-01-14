#!/bin/bash

build_library() {
  library_name="$1"
  source_folder="$2"

  build_folder="$source_folder/build"
  
  echo "[${library_name}][build.sh] Compile ${library_name} ... "
    cmake -G Ninja -B "$build_folder" -S "$source_folder" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_PREFIX_PATH="$PREFIX"
    cmake --build "$build_folder"
    cmake --install "$build_folder"
}

# Baseline Dir
LIBRARY_PATH=$(realpath "$0")
LIBRARY_DIR=$(dirname "$LIBRARY_PATH")

## Build SiftGPU
library_name="SiftGPU"
source_folder="${LIBRARY_DIR}"
build_library ${library_name} ${source_folder}