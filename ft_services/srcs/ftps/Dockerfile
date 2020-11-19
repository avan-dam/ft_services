FROM    alpine:latest

RUN     apk add --update --no-cache vsftpd openssl
RUN     rm -f /var/cache/apk/*
RUN     mkdir -p /etc/ssl/private
RUN     openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
COPY    srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN     mkdir -p /var/ftp
RUN     adduser -D -h /var/ftp ambo && \
        echo "ambo:pass" | chpasswd
RUN     chmod 600 /etc/ssl/*
# ENV     FTP_USER=ambo
# ENV     FTP_PASS=pass

EXPOSE  20 21 30000

CMD     vsftpd /etc/vsftpd/vsftpd.conf
