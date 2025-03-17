FROM python:3.12-alpine

RUN pip install --no-cache-dir lgst

WORKDIR /data

RUN libgen-seedtools generate-config

ENTRYPOINT ["libgen-seedtools"]
