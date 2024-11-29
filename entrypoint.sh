#!/bin/bash
set -meuo pipefail

KOBO_DIR=/kobo/.Kobocoin/
KOBO_CONF=/kobo/.Kobocoin/Kobocoin.conf

if [ -z "${KOBO_RPCPASSWORD:-}" ]; then
  # Provide a random password.
  KOBO_RPCPASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 24 ; echo '')
fi

if [ ! -e "${KOBO_CONF}" ]; then
  tee -a >${KOBO_CONF} <<EOF
server=1
rpcuser=${KOBO_RPCUSER:-kobocoinrpc}
rpcpassword=${KOBO_RPCPASSWORD}
EOF
echo "Created new configuration at ${KOBO_CONF}"
fi

if [ $# -eq 0 ]; then
  /usr/local/bin/kobocoind -rpcbind=0.0.0.0 -rpcport=3341 -rpcallowip=0.0.0.0/0 -printtoconsole=1
else
  exec "$@"
fi
