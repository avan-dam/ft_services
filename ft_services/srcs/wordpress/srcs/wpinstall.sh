#!/bin/sh
# go correct dir
cd /www/
# download and install wp with admin user set to Ambie
wp core download
wp core install --url=wordpress/ --path=/www --title="MY OWN AMBER SITE" --admin_user="Ambie" --admin_password="password" --admin_email="mysql@mysql.com"
# create a few users
wp user create a a@example.com --role=editor --user_pass=editor
wp user create b b@example.com --role=author --user_pass=author
wp user create c c@example.com --role=contributor --user_pass=contributor
wp user create d d@example.com --role=subscriber --user_pass=subscriber

