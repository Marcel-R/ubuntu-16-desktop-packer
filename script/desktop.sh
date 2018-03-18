#!/bin/bash

SSH_USER=${SSH_USERNAME:-vagrant}

. /etc/lsb-release
apt-get install -y gnome-shell ubuntu-gnome-desktop

if [ -d /etc/xdg/autostart/ ]; then
NODPMS_CONFIG=/etc/xdg/autostart/nodpms.desktop
    echo "[Desktop Entry]" >> $NODPMS_CONFIG
    echo "Type=Application" >> $NODPMS_CONFIG
    echo "Exec=xset -dpms s off s noblank s 0 0 s noexpose" >> $NODPMS_CONFIG
    echo "Hidden=false" >> $NODPMS_CONFIG
    echo "NoDisplay=false" >> $NODPMS_CONFIG
    echo "X-GNOME-Autostart-enabled=true" >> $NODPMS_CONFIG
    echo "Name[nl_NL]=nodpms" >> $NODPMS_CONFIG
    echo "Name=nodpms" >> $NODPMS_CONFIG
    echo "Comment[nl_NL]=" >> $NODPMS_CONFIG
    echo "Comment=" >> $NODPMS_CONFIG
fi

locale-gen
localectl set-locale LANG="nl_NL.UTF-8"
