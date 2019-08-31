#!/usr/bin/env bash
set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

# Maintained by Pascal Andy
# https://twitter.com/askpascalandy
# https://pascalandy.com/blog/now/

# --- # --- # --- #
# FUNCTIONS       #
# --- # --- # --- #

randompass=$(openssl rand -base64 850 | sed 's/[^a-zA-Z0-9]//g' | head -n1 | cut -c1-64) && clear && \
echo "${randompass}" && echo;