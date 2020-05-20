#!/bin/bash

cd ${HOME}/temp

. env-vars.sh

git clone https://github.com/deephealthproject/use_case_pipeline.git
cd use_case_pipeline


UCP_PATH=$(pwd)
#DEVICE="GPU"
#BUILD_TYPE="Release"
# BUILD_TYPE="Debug"
DEPENDENCIES_DIR="deephealth_lin"
#OPENCV_VERSION=4.3.0
PROC=$(($(nproc)-1))

#mkdir -p $DEPENDENCIES_DIR && cd $DEPENDENCIES_DIR

############ PIPELINE
cd $UCP_PATH
mkdir -p bin_lin && cd bin_lin
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$BUILD_TYPE -Decvl_DIR=$ECVL_INSTALL_DIR  ..
make -j$PROC && ./MNIST_BATCH
