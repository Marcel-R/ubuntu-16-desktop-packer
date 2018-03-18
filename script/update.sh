#!/bin/bash -eux

sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

echo "upgrade all"
apt-get upgrade -yq 