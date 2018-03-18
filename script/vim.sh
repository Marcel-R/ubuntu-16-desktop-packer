#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

echo "set up vim preferences" 
apt-get install vim -yq
curl --silent --output /etc/vim/vimrc.local https://raw.githubusercontent.com/Marcel-R/misc/master/vimrc.local