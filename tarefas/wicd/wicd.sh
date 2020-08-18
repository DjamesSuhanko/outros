#!/bin/bash

mount -o remount,rw /
service wicd stop
systemctl disable wicd
apt-get -y purge wicd
mv /etc/xdg/autostart/wicd-tray.desktop /etc/dbus-1/wicd.conf.donotstart
shutdown -r now
