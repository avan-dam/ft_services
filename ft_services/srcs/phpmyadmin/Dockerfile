FROM alpine:latest

RUN apk update --no-cache && \
    apk add busybox php7 php7-bz2 php7-ctype php7-curl php7-gd && \
    apk add nginx php7-json php7-mbstring php7-mysqli php7-openssl php7-session php7-zip wget && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mkdir -p /run/nginx 

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./srcs/homepage /var/www/localhost/htdocs/.

COPY ./srcs/config.inc.php /www/
COPY ./srcs/localhost.crt etc/ssl/certs/
COPY ./srcs/localhost.key etc/ssl/certs/
RUN  mkdir -p /run/nginx 
RUN chmod -R 777 /www
WORKDIR /wwww
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz

COPY ./srcs/startup.sh /www
# start it all

CMD	[ "sh", "-c", "/tmp/startup.sh]



# # RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
# COPY srcs/config.inc.php /etc/phpmyadmin/config.inc.php
# COPY srcs/startup.sh /startup.sh
# ENTRYPOINT [ "/startup.sh" ]
