#!/bin/bash

build_library() {
  library_name="$1"
  source_folder="$2"

  build_folder="$source_folder/build"
  
  echo "[ORB-SLAM3][build.sh] Compile ${library_name} ... "
  cmake -G Ninja -B $build_folder -S $source_folder -DCMAKE_PREFIX_PATH=$source_folder -DCMAKE_INSTALL_PREFIX=$PREFIX
  cmake --build $build_folder --config Release
  cmake --install $build_folder
  
}

# Baseline Dir
LIBRARY_PATH=$(realpath "$0")
LIBRARY_DIR=$(dirname "$LIBRARY_PATH")

# Build DBoW2
library_name="DBoW2"
source_folder="${LIBRARY_DIR}/Thirdparty/${library_name}"
build_library ${library_name} ${source_folder} 

# Build g2o
library_name="g2o"
source_folder="${LIBRARY_DIR}/Thirdparty/${library_name}"
build_library ${library_name} ${source_folder} 

# Build Sophus
library_name="Sophus"
source_folder="${LIBRARY_DIR}/Thirdparty/${library_name}"
build_library ${library_name} ${source_folder} 

## Build ORB-SLAM3
library_name="ORB-SLAM3"
source_folder="${LIBRARY_DIR}"
build_library ${library_name} ${source_folder}
