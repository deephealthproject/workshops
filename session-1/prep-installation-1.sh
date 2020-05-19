#!/bin/bash

apt -y update
apt -y upgrade
apt -y install build-essential p7zip-full make gcc-8 g++-8 gcc g++ zlib1g-dev libeigen3-dev wget ca-certificates

# add these the export lines in ${HOME}/.bashrc

cat >>${HOME}/.bashrc <<-EOF

export CC=/usr/bin/gcc-8
export CXX=/usr/bin/g++-8

EOF

echo "###############################################"
echo "logout and login again, then continue with the "
echo "following shell-script                         "
echo "                                               "
echo "    prep-installaton-2.sh                      "
echo "                                               "
echo "###############################################"
exit 0
