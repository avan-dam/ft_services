FROM    alpine:3.11

# install php nginx
RUN     apk update --no-cache && \
        apk add curl nginx wget && \
        apk add gettext bash && \
        apk add php7-common php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
        apk add php7-phar php7-cli php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap && \
        apk add php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom mysql-client
# set up nginx
RUN     adduser -D -g 'www' www && \
        mkdir /www && \
        chown -R www:www /var/lib/nginx && \
        chown -R www:www /www
RUN     mkdir -p /run/nginx 
COPY    ./srcs/nginx.conf /etc/nginx

# wordpress
RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/bin/wp && \
        chown www:www /usr/bin/wp

# config wordpress
COPY    srcs/wp-config.php tmp/wp-config.php
# permissions and change dir
RUN     chmod +x tmp/wp-config.php
RUN     cp tmp/wp-config.php /www/wp-config.php
# add in startup file and install file for wp and give it permissions
COPY    srcs/startup.sh .
COPY    srcs/wpinstall.sh /tmp/wpinstall.sh
RUN     chmod +x ./startup.sh /tmp/wpinstall.sh /www/wp-config.php
# cleanup
RUN     rm tmp/wp-config.php

# expose correct port
EXPOSE  5050
# startup
CMD     sh ./startup.sh