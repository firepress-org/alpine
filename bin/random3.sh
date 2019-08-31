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

grp1=$(openssl rand -base64 32 | sed 's/[^a-zA-Z0-9]//g' | cut -c11-14) && \
grp2=$(openssl rand -base64 32 | sed 's/[^a-zA-Z0-9]//g' | cut -c1-24) && \
grp3=$(openssl rand -base64 32 | sed 's/[^a-zA-Z0-9]//g' | cut -c21-24) && \
clear && \
echo "${grp1}_${grp2}_${grp3}" && echo;
