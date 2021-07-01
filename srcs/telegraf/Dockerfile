FROM    alpine:3.12

# install necessary packages and repository to run telegraf
RUN     apk update --no-cache && \
        apk add telegraf \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# expose correct port
EXPOSE  4999
# start up
CMD     telegraf