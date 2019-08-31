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

clear && \
\
pull_number=$(curl https://hub.docker.com/v2/repositories/devmtl/ | jq | sed -n 6,20p | grep pull_count | head -n1 | tr -d -c 0-9 | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta') && \
\
echo && \
echo "$pull_number is the number of times this docker image was pulled." && \
\
echo && \
curl https://hub.docker.com/v2/repositories/devmtl/ | jq | sed -n 6,20p;
