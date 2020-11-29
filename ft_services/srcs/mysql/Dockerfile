# FROM    alpine
FROM    alpine:latest

# add mysql 
RUN     apk add mysql mysql-client
# remove excess files
RUN     rm -f /var/cache/apk/*
# add start up file (which installs mysql and creates database with same values as wordpress so they can communicate)
COPY    srcs/startup.sh /tmp/startup.sh
# permissions
RUN     chmod +x /tmp/startup.sh
# config file with same values for username and password
COPY    srcs/my.cnf /etc/

# expose port
EXPOSE 3306

# start up
CMD     sh /tmp/startup.sh
