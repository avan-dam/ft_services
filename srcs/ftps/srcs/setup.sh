#!/bin/sh

# add user
adduser -D -h /var/ftp ambo
echo "ambo:pass" | chpasswd
vsftpd /etc/vsftpd/vsftpd.conf