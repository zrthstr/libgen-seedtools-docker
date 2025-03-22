FROM python:3.12-alpine3.21

RUN pip install --no-cache-dir lgst
RUN apk add --no-cache transmission-daemon transmission-remote
RUN mkdir -p /downloads /data
WORKDIR /data
RUN libgen-seedtools generate-config

EXPOSE 9091 51413 51413/udp
CMD ["transmission-daemon", "--foreground", "--config-dir", "/data" ]
