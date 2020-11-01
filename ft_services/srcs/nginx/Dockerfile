FROM alpine:latest
#install nginx
RUN apk update --no-cache
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# RUN chown -R www:www /etc/nginx
# RUN chown -R www:www /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/nginx.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/localhost/htdocs/
# RUN vi /etc/nginx/nginx.conf
# RUN ln -s /etc/nginx/sites-available/amber /etc/nginx/sites-enabled/amber
# copy in certificates
COPY ./srcs/localhost.crt etc/ssl/certs/
COPY ./srcs/localhost.key etc/ssl/certs/
RUN mkdir -p /run/nginx
EXPOSE 80 443

# start it all
CMD	["nginx", "-g", "daemon off;"]

# CMD service nginx start && bash
# CMD rc-service nginx start
# FROM alpine:3.12ßß
# #install nginx
# RUN apk update
# RUN apk upgrade --available
# RUN apk add --no-cache
# RUN apk add nginx
# COPY ./srcs/nginx.conf etc/nginx/sites-available/amber
# # RUN ln -s /etc/nginx/sites-available/amber /etc/nginx/sites-enabled/amber
# # copy in certificates
# COPY ./srcs/localhost.crt etc/ssl/certs/
# COPY ./srcs/localhost.key etc/ssl/certs/
# # ownership rights and then permissions
# # RUN chown -R www-data:www-data /var/www/html
# # RUN chmod 775 -R var/www/html
# # RUN chmod 775 -R var/www/html/phpmyadmin

# EXPOSE 80 443

# # start it all
# CMD service nginx start && bash