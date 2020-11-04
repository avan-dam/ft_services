FROM alpine

RUN	apk add mysql mysql-client

COPY srcs/startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh
COPY srcs/my.cnf /etc/
VOLUME /var/lib/mysql

CMD ./tmp/startup.sh

ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]



# FROM    alpine:latest
# RUN	   	apk update && \
# 		apk upgrade --available && \
# 		apk add mysql mysql-client && \
#     	rm -f /var/cache/apk/* 
# COPY    srcs/startup.sh /tmp/startup.sh
# RUN     chmod +x /tmp/startup.sh
# COPY	srcs/my.cnf /etc/

# VOLUME  /var/lib/mysql
# # EXPOSE  3306
# ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]





# CMD     sh /tmp/startup.sh
# ENTRYPOINT ["sh /tmp/startup.sh"]
# environment set up
# ENV 	MYSQL_ROOT_PASSWORD="admin"
# ENV 	MYSQL_DB_NAME="wordpress"
# ENV 	MYSQL_USER="rooty"
# ENV	MYSQL_PASSWORD="password"
# ENV	MYSQL_HOME=/etc/

# install MariaDB
# RUN apk add mysql mysql-client

# RUN chmod +x /var/lib/mysql
# ENV MYSQL_DATABASE db
# ENV MYSQL_ROOT_PASSWORD pass
# # COPY db.sql /docker-entrypoint-initdb.d/db.sql
# COPY srcs/my.cnf /etc/mysql/my.cnf
# RUN /entrypoint.sh mysqld & sleep 30 && killall mysqld
# RUN rm /docker-entrypoint-initdb.d/db.sql
# You can modify this behavior but must edit the service file at /etc/init.d directory

# COPY srcs/startup.sh /tmp/startup.sh
# RUN chmod +x /tmp/startup.sh && \
#     mkdir /var/lib/ && \
#     mkdir /var/lib/mysql/ && \
#     mkdir /var/lib/mysql/mysql && \
#     chown -R mysql:mysql /var/lib/mysql 
# Copy of the MySQL startup script
# COPY srcs/start.sh start.sh
# Creating the persistent volume
# RUN	["mysql", "-g", "daemon off;"] && \
    # echo "CREATE DATABASE wordpress;" | mysql -u root && \
    # echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'localhost' IDENTIFIED BY 'password';" | mysql -u root && \
    # echo "GRANT SELECT, INSERT, DELETE, UPDATE ON phpmyadmin.* TO 'root'@'localhost';" | mysql -u root && \
    # echo "FLUSH PRIVILEGES" | mysql -u root && \
    # echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/tmp/startup.sh"]