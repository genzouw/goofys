#!/bin/sh
set -o errexit

# Check
for VAR_NAME in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY BUCKET; do
  VAR_VAL="$(eval echo \"\$$VAR_NAME\")"
  if test -z "${VAR_VAL}"; then
    echo "Specify ${VAR_NAME}"
    exit 1
  fi
done

# Use the bucket name if no mount dir is specified
MOUNT_DIR="${MOUNT_DIR:-/mnt/$BUCKET}"

USER="$(whoami)"

install -d -o "${USER}" -g "${USER}" -m 0700 "${MOUNT_DIR}"
install -d -o "${USER}" -g "${USER}" -m 0700 "${HOME}/.aws/"
cat <<EOF >"${HOME}/.aws/credentials"
[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOF

goofys -o allow_other -f "${BUCKET}" "${MOUNT_DIR}"
