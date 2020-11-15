FROM    alpine:latest

# ENV INFLUXDB_CONFIG_PATH /etc/influxdb.conf

RUN     apk update --no-cache && \
	    apk add --no-cache influxdb

EXPOSE  8086

CMD influxd run -config /etc/influxdb.conf
