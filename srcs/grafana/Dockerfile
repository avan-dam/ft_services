FROM    alpine:3.12

# make sure grafana knows where to work from otherwise cant start
WORKDIR /usr/share/grafana

# add update grafana and repository
RUN     apk update --no-cache && \
        apk add grafana/grafana:6.5.0 \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
# copy dashboards into correct place
COPY    srcs/*.json /usr/share/grafana/public/dashboards/

# expose correct port
EXPOSE  3000
# start grafana
CMD     grafana-server
