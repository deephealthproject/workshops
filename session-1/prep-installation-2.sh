#!/bin/bash

# Installing Anaconda

cd ${HOME}

if [ ! -d ${HOME}/anaconda3 ]
then
	wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O /tmp/Anaconda3-2020.02-Linux-x86_64.sh
	bash /tmp/Anaconda3-2020.02-Linux-x86_64.sh
fi

echo "###############################################"
echo "logout and login again, then continue with the "
echo "following shell-script                         "
echo "                                               "
echo "    prep-installaton-3.sh                      "
echo "                                               "
echo "###############################################"
exit 0
