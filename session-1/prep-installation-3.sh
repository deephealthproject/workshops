#!/bin/bash

# Upgrading Anaconda

cd ${HOME}

conda upgrade --all

# Preparing the environment for EDDL

wget https://raw.githubusercontent.com/deephealthproject/eddl/master/environment.yml
conda env create -f environment.yml

cat >>${HOME}/.bashrc <<-EOF

export LD_LIBRARY_PATH="${HOME}/anaconda3/envs/eddl/lib"

conda activate eddl

EOF

echo "###############################################"
echo "logout and login again, then continue with the "
echo "following shell-script                         "
echo "                                               "
echo "    install-eddl-from-source.sh                "
echo "                                               "
echo "###############################################"
exit 0

