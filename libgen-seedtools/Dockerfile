FROM python:3.12-alpine3.21

RUN pip install --no-cache-dir lgst

WORKDIR /data

RUN libgen-seedtools generate-config

ENTRYPOINT ["libgen-seedtools"]
