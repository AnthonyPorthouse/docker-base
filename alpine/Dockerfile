FROM alpine

ENV PUID=1000
ENV PGID=1000
ENV USER=alpine

COPY ./set-up-user.sh /usr/local/bin/set-up-user
COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]
