FROM    alpine:latest

WORKDIR /usr/share/grafana

RUN     apk update --no-cache && \
        apk add grafana \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY    srcs/*.json /usr/share/grafana/public/dashboards/

EXPOSE  3000

CMD     grafana-server
