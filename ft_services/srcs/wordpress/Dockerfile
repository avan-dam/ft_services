FROM    alpine:latest

# install php nginx
RUN     apk update --no-cache && \
        apk add php7-common php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli php7-zip php7-iconv php7-xml && \
        apk add curl nginx php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-imap php7-cgi fcgi
# wget
# set up nginx
RUN     mkdir -p /run/nginx 
RUN     adduser -D -g 'www' www && \
        mkdir /www && \
        chown -R www:www /var/lib/nginx && \
        chown -R www:www /www
COPY    ./srcs/nginx.conf /etc/nginx

# wordpress
# RUN     wget -c https://wordpress.org/latest.tar.gz
# RUN     tar -xzvf latest.tar.gz -C /www
RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/bin/wp && \
        chown www:www /usr/bin/wp
COPY    srcs/wp-config.php /www/wordpress/wp-config.php

EXPOSE  5050

CMD     ["php-fpm7", "/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
