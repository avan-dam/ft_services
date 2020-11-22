FROM    alpine

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

# DO I NEED THIS LINE?? IF BROKEN COMMENT BACK IN
# VOLUME  /var/lib/mysql

EXPOSE 3306

CMD     sh /tmp/startup.sh


# FROM    alpine

# # add mysql 
# RUN     apk add mysql mysql-client
# # remove excess files
# RUN     rm -f /var/cache/apk/*

# # add start up file (which creates )
# COPY    srcs/startup.sh /tmp/startup.sh
# RUN     chmod +x /tmp/startup.sh
# COPY    srcs/my.cnf /etc/

# VOLUME  /var/lib/mysql

# CMD     sh /tmp/startup.sh


# EXPOSE 3306

# ENTRYPOINT ["/tmp/startup.sh"]