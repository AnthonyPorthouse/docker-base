#! /usr/bin/env sh

PUID=${PUID:-1000}
PGID=${PGID:-1000}
USER=${USER:-"alpine"}

set-up-user "$USER" "$PUID" "$PGID"

COMMAND="${*:-"sh"}"

su "${USER}" -c "$COMMAND"
