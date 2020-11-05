FROM alpine:latest

RUN apk update --no-cache && \
    apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json && \
    apk add nginx php7-session php7-zip wget

# COPY ./srcs/homepage /var/www/localhost/htdocs/.

RUN mkdir -p /run/nginx 
RUN adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	mv -v phpMyAdmin-5.0.2-all-languages/* /www/
RUN	rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	rm -rf phpMyAdmin-5.0.2-all-languages

COPY ./srcs/config.inc.php /www
COPY ./srcs/nginx.conf /etc/nginx

EXPOSE 5000

COPY srcs/startup.sh /www
RUN chmod +x /www/startup.sh
CMD sh www/startup.sh
# start it all

# CMD	[ "sh", "-c", "/tmp/startup.sh]



# # RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
# COPY srcs/config.inc.php /etc/phpmyadmin/config.inc.php
# COPY srcs/startup.sh /startup.sh
# ENTRYPOINT [ "/startup.sh" ]
