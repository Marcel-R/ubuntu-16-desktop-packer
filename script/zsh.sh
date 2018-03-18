#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

apt-get install \
	 git-core \
	 zsh -yq
	 
echo "Install oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh` 
chsh -s `which zsh` vagrant
