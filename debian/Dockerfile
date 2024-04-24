FROM debian:12-slim

ENV USER=debian

COPY ./set-up-user.sh /usr/local/bin/set-up-user
COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]
