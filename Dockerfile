FROM ubuntu:latest

ARG BUILD_DATE
LABEL org.label-schema.name="BorgBackup" \
      org.label-schema.description="Ubuntu based BorgBackup docker image" \
      org.label-schema.vendor="Savvas Dalkitsis <kurosavvas@gmail.com>" \
      org.label-schema.version=latest \
      org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=${BUILD_DATE}

LABEL image.name="ubuntu_borgbackup" \
      image.description="Ubuntu based BorgBackup docker image" \
      maintainer.name="Savvas Dalkitsis <kurosavvas@gmail.com>"

RUN apt-get update && apt-get -y install borgbackup

USER root

WORKDIR /

ENTRYPOINT [ "borg" ]

CMD [ "--show-version" ]
