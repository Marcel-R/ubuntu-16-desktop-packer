#!/bin/bash -eux

export DEBIAN_FRONTEND=noninteractive

echo "install docker pre-req"
apt-get install apt-transport-https dirmngr -yq

echo 'deb https://apt.dockerproject.org/repo debian-stretch main' >> /etc/apt/sources.list
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt-get update

echo "Install marcel's tools"
apt-get install docker-engine -yq
