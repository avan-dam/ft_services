FROM    alpine:3.12

# add update and influxdb
RUN     apk update --no-cache && \
	    apk add --no-cache influxdb

# expose correct port
EXPOSE  8086
# run influxdb
CMD influxd run -config /etc/influxdb.conf
