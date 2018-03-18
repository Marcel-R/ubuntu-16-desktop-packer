#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

echo "Install tools"
apt-get install \
     ca-certificates \
	 ipcalc \
     curl \
     gnupg2 \
     software-properties-common \
	 aptitude \
	 net-tools -yq &>> $log_file