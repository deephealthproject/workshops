
export CC=/usr/bin/gcc-8
export CXX=/usr/bin/g++-8

export DEVICE="GPU"
export BUILD_TYPE="Release"

export EDDL_INSTALL_DIR="${CONDA_PREFIX}/lib/cmake/eddl"
#export EDDL_INSTALL_DIR="${HOME}/temp/eddl/build/install/lib/cmake/eddl"
export EDDL_DIR="${HOME}/anaconda3/envs/eddl/lib/cmake/eddl/"


export OPENCV_VERSION=4.3.0
export OPENCV_INSTALL_DIR=${HOME}/temp/opencv-${OPENCV_VERSION}/build

export ECVL_INSTALL_DIR=${HOME}/temp/ecvl/build/cmake

export PROC=$(($(nproc)-1))

