#!/bin/bash
#desabilitar bluetooth:
#/boot/config.txt
echo "dtoverlay=pi3-disable-bt" >>/boot/config.txt

systemctl disable hciuart.service
systemctl disable bluealsa.service
systemctl disable bluetooth.service

#desabilitar syslog e rsyslog:
service syslog stop 2>/dev/null
service rsyslog stop 2 >/dev/null

systemctl disable syslog
systemctl disable rsyslog

rm -f /var/log/*
shutdown -r now
