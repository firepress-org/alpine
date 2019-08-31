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

mypath="/root/html5boilerplate/.store"
#
password=$(cat ${mypath}/b2secret)
user=$(cat ${mypath}/usermail)
salt=$(cat ${mypath}/ispepper)
#
user_salt=$(echo -n "${user} ${salt}" | sha256sum | cut -c1-64)
passhash=$(echo -n ${password} | sha256sum | cut -c1-64)
# reset
password="null"
user="null"
salt="null"
#
final_hash=$(echo -n "${user_salt} ${passhash}" | sha256sum | cut -c1-64)