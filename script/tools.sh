#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

echo "update locales"
locale-gen nl_NL
locale-gen nl_NL.UTF-8
dpkg-reconfigure locales

echo "Install tools"
apt-get install \
     ca-certificates \
	 ipcalc \
     curl \
     gnupg2 \
     software-properties-common \
	 aptitude \
	 net-tools -yq