FROM    alpine:3.11

# installing and setting up nginx
RUN		apk --update add --no-cache openssh && \
    	apk add nginx && \
		apk add openssl && \
		adduser -D -g 'www' www && \
		mkdir /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

# nginx config and my website 
COPY	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/homepage /var/www/localhost/htdocs/.
# ssh
RUN		rm  -rf /tmp/* /var/cache/apk/* && \
		rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key && \
	  	adduser -D user && \
	    echo "user:password" | chpasswd && \
		sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config && \
		/usr/bin/ssh-keygen -A 
RUN 	ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key
# certificates
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=amber' -keyout etc/ssl/certs/localhost.key -out etc/ssl/certs/localhost.crt

# start web server
RUN		mkdir -p /run/nginx 
# expose correct ports
EXPOSE	80 443 22

# start it all
COPY    srcs/startup.sh /tmp
RUN		chmod +x tmp/startup.sh
CMD     sh /tmp/startup.sh

# check ssh : § ssh user@192.168.99.201   then password:password
