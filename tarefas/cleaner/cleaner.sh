#!/bin/bash

service wicd stop
systemctl disable wicd
mount -o remount,rw /
apt-get -y purge wicd
mv /etc/xdg/autostart/wicd-tray.desktop /etc/dbus-1/wicd.conf.donotstart 2>/dev/null

#desabilitar bluetooth:
#/boot/config.txt
echo "dtoverlay=pi3-disable-bt" >>/boot/config.txt

systemctl disable hciuart.service
systemctl disable bluealsa.service
systemctl disable bluetooth.service

#desabilitar syslog e rsyslog:
service syslog stop
service rsyslog stop

systemctl disable syslog
systemctl disable rsyslog

rm -f /var/log/*

#LXPANEL consumindo picas de CPU:
#- remover os widgets não usados
#- lxpanelctl restart

shutdown -r now
#==========================
#homie
