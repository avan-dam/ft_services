FROM    alpine:latest

WORKDIR /usr/share/grafana/bin
RUN     apk update --no-cache && \
    	apk upgrade --no-cache && \
        apk add grafana \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY    srcs/mysql-dashboard.json /usr/share/grafana/public/dashboards/mysql-dashboard.json
EXPOSE  3000
CMD     grafana-server
