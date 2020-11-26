FROM alpine:latest

# Update the packagelist and Install the additional packages
RUN apk update --no-cache && \
    apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json && \
    apk add nginx php7-session php7-zip wget
    # apk add openssl
# set up nginx for phpmyadmin
RUN adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www
RUN mkdir -p /run/nginx 

# download sourcecode for phpmyadmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
# Unpack the archive and remove the archive
RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	mv -v phpMyAdmin-5.0.2-all-languages/* /www/
RUN	rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	rm -rf phpMyAdmin-5.0.2-all-languages
# to correct this warning: The $cfg['TempDir'] (/www/tmp/) is not accessible. phpMyAdmin is not able to cache templates and will be slow because of this.
RUN mkdir -p /www/tmp
RUN chmod 777 /www/tmp
# copy config for phpmyadmin and nginx
COPY ./srcs/config.inc.php /www/
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
# certificates to allow for redirect
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=amber' -keyout etc/ssl/certs/localhost.key -out etc/ssl/certs/localhost.crt

# expose port
EXPOSE 5000

# startup
COPY srcs/startup.sh /www
RUN chmod +x /www/startup.sh
CMD sh www/startup.sh


# FROM alpine:latest

# # Update the packagelist and Install the additional packages
# RUN apk update --no-cache && \
#     apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json && \
#     apk add nginx php7-session php7-zip wget
#     # apk add openssl
# # set up nginx for phpmyadmin
# RUN mkdir -p /run/nginx 
# RUN adduser -D -g 'www' www && \
#     mkdir /www && \
#     chown -R www:www /var/lib/nginx && \
#     chown -R www:www /www

# # download sourcecode for phpmyadmin
# RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
# # Unpack the archive and remove the archive
# RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN	mv -v phpMyAdmin-5.0.2-all-languages/* /www/
# RUN	rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN	rm -rf phpMyAdmin-5.0.2-all-languages
# # to correct this warning: The $cfg['TempDir'] (/www/tmp/) is not accessible. phpMyAdmin is not able to cache templates and will be slow because of this.
# RUN mkdir -p /www/tmp
# RUN chmod 777 /www/tmp
# # THIS ADDED
# RUN chmod 777 /www
# # copy config for phpmyadmin and nginx
# COPY ./srcs/config.inc.php /www
# COPY ./srcs/nginx.conf /etc/nginx
# # certificates to allow for redirect
# # RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=amber' -keyout etc/ssl/certs/localhost.key -out etc/ssl/certs/localhost.crt

# # expose port
# EXPOSE 5000

# # startup
# COPY srcs/startup.sh /www
# RUN chmod +x /www/startup.sh
# CMD sh www/startup.sh
