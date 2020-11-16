FROM	alpine:latest

RUN		apk update --no-cache && \
    	apk add nginx && \
		adduser -D -g 'www' www && \
		mkdir /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

COPY	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/homepage /var/www/localhost/htdocs/.

COPY	./srcs/localhost.crt etc/ssl/certs/
COPY	./srcs/localhost.key etc/ssl/certs/
RUN		mkdir -p /run/nginx 

EXPOSE	80 443

# start it all
CMD		["nginx", "-g", "daemon off;"]
