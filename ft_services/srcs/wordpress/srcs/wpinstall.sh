#!/bin/sh

cd /www/

wp core download
wp core install --url=wordpress/ --path=/www --title="MY OWN AMBER SITE" --admin_user="Ambie" --admin_password="password" --admin_email="mysql@mysql.com"
:> /tmp/postid
wp term create category AMBERINO
wp post create --post_author=Me --post_category="AMBERINO" --post-title="LOVE YOU" --post-content="iets" --post_excerpt=tag --post_status=publish | awk '{gsub(/[.]/, ""); print $4}' > /tmp/postid


wp user create a a@example.com --role=editor --user_pass=editor
wp user create b b@example.com --role=author --user_pass=author
wp user create c c@example.com --role=contributor --user_pass=contributor
wp user create d d@example.com --role=subscriber --user_pass=subscriber

wp theme install Sarada
wp theme activate Sarada