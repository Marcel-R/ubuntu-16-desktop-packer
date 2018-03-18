#!/bin/bash -eux

echo "purging office suite"
apt-get remove --purge evolution -yq 
apt-get remove --purge libreoffice* -yq 

apt-get clean 
apt autoremove -y