FROM alpine:3.21

RUN apk add --no-cache transmission-daemon transmission-remote

RUN mkdir -p /downloads /data

#EXPOSE 9091 51413 51413/udp

CMD ["transmission-daemon", "--foreground", "--config-dir", "/data" ]
