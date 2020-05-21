#!/bin/bash

cd ${HOME}/temp

. env-vars.sh

############ ECVL
if [ ! -d ecvl ]
then
	git clone https://github.com/deephealthproject/ecvl.git
	cd ecvl
	git checkout c3bcad0a722c319724dd660b58c93bf8b154e37c # Latest master, waiting for the release
else
	cd ecvl
fi
mkdir -p build && cd build

cmake -G "Unix Makefiles" \
	-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
	-DOpenCV_DIR=$OPENCV_INSTALL_DIR \
	-Deddl_DIR=$EDDL_INSTALL_DIR \
	-DECVL_BUILD_EDDL=ON \
	-DECVL_DATASET=ON \
	-DECVL_BUILD_GUI=OFF \
	-DECVL_WITH_DICOM=ON \
	-DCMAKE_INSTALL_PREFIX=install ..

make -j$PROC && make install


ECVL_INSTALL_DIR=${HOME}/temp/ecvl/build/cmake


echo "###############################################"
echo "continue with the following shell-script       "
echo "                                               "
echo "    build_pipeline_2.sh                        "
echo "                                               "
echo "###############################################"
exit 0

