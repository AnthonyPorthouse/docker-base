#!/usr/bin/env sh
set -e

# Username/Groupname to use
USER=$1

# Target User ID
PUID=$2

# Target Group ID
PGID=$3

# If user exists, and id or gid don't match what we have
if
    [ -n "$(getent passwd "${USER}" >/dev/null 2>&1)" ] &&
    { [ "$(id -u "${USER}" >/dev/null 2>&1)" != "$PUID" ] || [ "$(id -g "${USER}" >/dev/null 2>&1)" != "$PGID" ]; }
then
    deluser --remove-home "${USER}"
    addgroup -S "${USER}" -g "${PGID}"
    adduser -S -s /bin/ash -G "${USER}" -u "${PUID}" "${USER}"
fi

# If user does not exist, create it
if [ -z "$(getent passwd "${USER}" >/dev/null 2>&1)" ]; then
    addgroup -S "${USER}" -g "${PGID}"
    adduser -S -s /bin/ash -G "${USER}" -u "${PUID}" "${USER}"
fi

echo "
-----------------------------------
GID/UID
-----------------------------------
User uid:    $(id -u "${USER}")
User gid:    $(id -g "${USER}")
-----------------------------------
"
