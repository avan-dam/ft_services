# !/bin/bash

# wait for mysql to start 

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
# once mysql started run php 
php-fpm7
# install wp
su -c "/tmp/wpinstall.sh" - www
# then run nginx
nginx
# make sure if nginx of php quit it restarts
while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done