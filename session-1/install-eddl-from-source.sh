#!/bin/bash

cd ${HOME}/temp

. env-vars.sh

git clone --recurse-submodule https://github.com/deephealthproject/eddl.git 
cd eddl
#git checkout 02e37c0dfb674468495f4d0ae3c159de3b2d3cc0 # Latest master, waiting for the release

mkdir -p build && cd build

#cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DBUILD_TARGET=$DEVICE -DBUILD_SUPERBUILD=ON -DCMAKE_INSTALL_PREFIX=install ..
cmake -G "Unix Makefiles" \
	-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
	-DBUILD_TARGET=$DEVICE \
	-DBUILD_SUPERBUILD=ON \
	-DCMAKE_PREFIX_PATH=${CONDA_PREFIX} \
	-DCMAKE_INSTALL_PREFIX=${CONDA_PREFIX} \
	-DBUILD_TESTS=ON \
	..

make -j$PROC && make install


echo "###############################################"
echo "continue with the following shell-script       "
echo "                                               "
echo "    install-opencv-from-source.sh              "
echo "                                               "
echo "###############################################"
exit 0

