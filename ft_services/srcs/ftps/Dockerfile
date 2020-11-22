FROM    alpine:latest

# add the necessary vsfpd and open ssl to be able to build ftps image
RUN     apk --update --no-cache add vsftpd openssl vim
# remove excess files
RUN     rm -f /var/cache/apk/*
# As a preparatory step, you need to first create a self-signed certificate. This is to encrypt your FTPS traffic.
RUN     openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
# copy config file in
COPY    srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
# add dir to create setup in setup.sh file
RUN     mkdir -p /var/ftp
COPY    srcs/setup.sh /tmp/
# permissions
RUN     chmod +x /tmp/setup.sh
RUN     chmod +x /etc/vsftpd/vsftpd.conf
RUN     chmod +x /etc/ssl/private/vsftpd.key
RUN     chmod +x /etc/ssl/certs/vsftpd.crt

# expose correct ports 20:command control 21:data transfer 30000:passive ftp
EXPOSE  20 21 30000

# start all
CMD ["sh", "-c", "/tmp/setup.sh"]


# # THIS IS WORKING
# FROM    alpine:latest

# # add the necessary vsfpd and open ssl to be able to build ftps image
# RUN     apk --update --no-cache add vsftpd openssl vim
# # remove excess files
# # RUN     rm -f /var/cache/apk/*
# # As a preparatory step, you need to first create a self-signed certificate. This is to encrypt your FTPS traffic.
# RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=ambo' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
# # RUN     openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
# # copy config file in
# COPY    srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
# # add dir to create setup in setup.sh file
# RUN     mkdir -p /var/ftp
# COPY    srcs/setup.sh /tmp/
#         # permissions
# RUN     chmod +x /tmp/setup.sh
# RUN     chmod +x /etc/vsftpd/vsftpd.conf
# RUN     chmod +x /etc/ssl/private/vsftpd.key
# RUN     chmod +x /etc/ssl/certs/vsftpd.crt


# # RUN     mkdir /ambo

# # expose correct ports 20:command control 21:data transfer 30000:passive ftp
# EXPOSE  20 21 30000

# # start all
# CMD ["sh", "-c", "/tmp/setup.sh"]