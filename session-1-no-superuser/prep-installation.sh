#!/bin/bash

# Preparing the environment for EDDL

wget https://raw.githubusercontent.com/deephealthproject/eddl/master/environment.yml
conda env create -f environment.yml

cat <<-EOF

####################################################################################
####################################################################################

    After this you have to activate the 'eddl' conda environment by manually
    execute the following command:

        conda activate eddl
    
    Once you do it, then update

        conda upgrade --all

    
    Now you are ready to run the remaining shell-scripts:

        install-eddl-from-source.sh
        install-opencv-from-source.sh
        install-ecvl-from-source.sh
        build_pipeline_2.sh

####################################################################################
####################################################################################
EOF

exit 0
