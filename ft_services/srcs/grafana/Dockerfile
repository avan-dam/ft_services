FROM    alpine:latest

WORKDIR /usr/share/grafana

# RUN     mkdir -p /var/lib/grafana/dashboards/
# WORKDIR /var/lib/grafana/dashboards/
RUN     apk update --no-cache && \
        apk add grafana \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY    srcs/*.json /usr/share/grafana/public/dashboards/
# COPY    srcs/grafana-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
# COPY    srcs/grafana-dashboard.yaml /var/lib/grafana/datasources/
# COPY    srcs/*.json /var/lib/grafana/dashboards/
EXPOSE  3000
CMD     grafana-server


# RUN mkdir /usr/share/grafana/conf/provisioning/dashboards/mine
# COPY srcs/*.json /usr/share/grafana/conf/provisioning/dashboards/mine/
# COPY dashboards/sample.yaml /usr/share/grafana/conf/provisioning/dashboards/