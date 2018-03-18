#!/bin/bash

date > /etc/box_build_time

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_PASS=${SSH_PASSWORD:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}
VAGRANT_INSECURE_KEY=$(curl --silent https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub)

if ! id -u $SSH_USER >/dev/null 2>&1; then
	echo "==> Creating $SSH_USER user"
	/usr/sbin/groupadd $SSH_USER
	/usr/sbin/useradd $SSH_USER -g $SSH_USER -G sudo -d $SSH_USER_HOME --create-home
	echo "${SSH_USER}:${SSH_PASS}" | chpasswd
fi

# Set up sudo
echo "==> Giving ${SSH_USER} sudo powers"
echo "${SSH_USER}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/$SSH_USER
chmod 440 /etc/sudoers.d/$SSH_USER

# Fix stdin not being a tty
if grep -q -E "^mesg n$" /root/.profile && sed -i "s/^mesg n$/tty -s \\&\\& mesg n/g" /root/.profile; then
  echo "Fixed stdin not being a tty."
fi

mkdir $SSH_USER_HOME/.ssh
chmod 700 $SSH_USER_HOME/.ssh
cd $SSH_USER_HOME/.ssh

echo "${VAGRANT_INSECURE_KEY}" > $SSH_USER_HOME/.ssh/authorized_keys
chmod 600 $SSH_USER_HOME/.ssh/authorized_keys
chown -R $SSH_USER:$SSH_USER $SSH_USER_HOME/.ssh
