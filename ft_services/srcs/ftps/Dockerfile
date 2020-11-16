FROM    alpine:latest

RUN     apk add --update --no-cache vsftpd openssl
RUN     mkdir -p /etc/ssl/private
RUN     openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
COPY    srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN     mkdir -p /var/ftp
RUN     adduser -D -h /var/ftp ambo && \
        echo "ambo:pass" | chpasswd
EXPOSE  21 10100

CMD     vsftpd /etc/vsftpd/vsftpd.conf
