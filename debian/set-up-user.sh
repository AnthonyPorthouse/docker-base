#!/usr/bin/env sh
set -ex

# Username/Groupname to use
USER=$1

# Target User ID
PUID=$2

# Target Group ID
PGID=$3

# if gid == 0 and pid !== 0 make gid == pid

# If no user exists, create it
if [ -z "$(getent passwd "${USER}" >/dev/null 2>&1)" ]; then
    groupadd --system --non-unique --gid "${PGID}" "${USER}"
    adduser --system --uid "${PUID}" --ingroup "${USER}" --shell /bin/bash --no-create-home --quiet "${USER}"

    getent passwd "$USER"
fi

# IF UID does not match, modify it
if [ ! "$(id -u "${USER}")" -eq "$PUID" ]; then usermod -o -u "$PUID" "${USER}"; fi

# If GID does not match, modify it
if [ ! "$(id -g "${USER}")" -eq "$PGID" ]; then groupmod -o -g "$PGID" "${USER}"; fi

echo "
-----------------------------------
GID/UID
-----------------------------------
User:        ${USER}
User uid:    $(id -u "${USER}")
User gid:    $(id -g "${USER}")
-----------------------------------
"
