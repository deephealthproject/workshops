
if [ "${CONDA_DEFAULT_ENV:-XX}" != "eddl" ]
then
    echo ""
    echo "FATAL ERROR: you are not in the 'eddl' conda environment!"
    echo ""
    exit 1
fi


export CC=/usr/bin/gcc-8
export CXX=/usr/bin/g++-8

export DEVICE="GPU"
export BUILD_TYPE="Release"

export EDDL_INSTALL_DIR="${CONDA_PREFIX}/lib/cmake/eddl"
export EDDL_DIR="${CONDA_PREFIX}/lib/cmake/eddl/"


export OPENCV_VERSION=4.3.0
export OPENCV_INSTALL_DIR=${HOME}/temp/opencv-${OPENCV_VERSION}/build

export ECVL_INSTALL_DIR=${HOME}/temp/ecvl/build/cmake

export PROC=$(($(nproc)-1))

export LD_LIBRARY_PATH="${CONDA_PREFIX}/eddl/lib:${LD_LIBRARY_PATH:-.}"
