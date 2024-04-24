#! /usr/bin/env sh

PUID=${PUID:-$(id -u)}
PGID=${PGID:-$(id -g)}
USER=${USER:-"debian"}

set-up-user "$USER" "$PUID" "$PGID"

COMMAND="${*:-"bash"}"

chown -R "$PUID:$PGID" .

su "${USER}" -Pc "$COMMAND"
