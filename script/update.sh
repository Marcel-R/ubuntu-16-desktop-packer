#!/bin/bash -eux

sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic


echo "purging office suite"
apt-get remove --purge evolution -yq 
apt-get remove --purge libreoffice* -yq 

apt-get clean 
apt autoremove -y

echo "upgrade all"
apt-get upgrade -yq 