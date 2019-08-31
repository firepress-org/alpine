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

# --- Generate keys
openssl req -nodes -newkey rsa:4096 -keyout someprivate.key -out somepublic.csr -subj "/C=NL/ST=Zuid Holland/L=Rotterdam/O=Sparkling Network/OU=IT Department/CN=zxc.qwe.org";

# --- Get the SHA256 out of the private key
echo;
cat someprivate.key | sha256sum;

# --- Get the SHA256 out of the private key
echo;
sha256sum someprivate.key;

# --- Show 10th line to 20th 
echo;
head -n 20 someprivate.key | tail -n 10;

# --- Clean up 
echo;
rm -f someprivate.key && rm -f somepublic.csr;