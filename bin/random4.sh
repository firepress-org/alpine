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

user="icipascal@gmail.com"
password="UnSafePassword"
mypath="/root/deploy-setup/config/strings"
salt=$(cat ${mypath}/dr_pepper)
#
user_salt=$(echo -n "${user} ${salt}" | sha256sum | cut -c1-64)
passhash=$(echo -n ${password} | sha256sum | cut -c1-64)
final_hash=$(echo -n "${user_salt} ${passhash}" | sha256sum | cut -c1-64)
# reset
salt="null"
user="null"
password="null"
passhash="null"
user_salt="null"
# show
echo; echo ${final_hash}; echo;

# 742642e47ecc24b0726e964a3d08a27bbeb479cde8548dde0f193c6992312ec3