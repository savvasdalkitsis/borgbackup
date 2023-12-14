FROM ubuntu:23.10

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

RUN apt-get update && apt-get -y install wget 

RUN wget https://github.com/borgbackup/borg/releases/download/1.2.7/borg-linux64 -O /usr/local/bin/borg && \
    sudo chown root:root /usr/local/bin/borg && \
    sudo chmod 755 /usr/local/bin/borg

USER root

WORKDIR /

ENTRYPOINT [ "borg" ]

CMD [ "--show-version" ]
