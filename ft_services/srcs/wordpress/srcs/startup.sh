# !/bin/bash

php-fpm7

while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done
echo "Connection with Mysql established."

su -c "/tmp/wpinstall.sh" - www
nginx -g "daemon off;"
# php -S 192.168.99.201:5050 -t /www/
# php -S 192.168.99.201:5050 -t /www/wordpress/
# php -S 0.0.0.0:5050 -t /www/wordpress/