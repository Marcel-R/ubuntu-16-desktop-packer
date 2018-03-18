#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

echo "install pycharm via snapd"
apt-get install snapd  -yq
snap install core 
snap install pycharm-community --classic