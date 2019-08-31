#!/usr/bin/env bash
set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

# GNU v3 | Please credit my work if you are re-using some of it :)
# by Pascal Andy | https://pascalandy.com/blog/now/

###############################################################################
# Functions
###############################################################################

IMG_alpine="devmtl/alpine:stable"
clear

echo && echo && \
docker run --rm -it \
-v $(pwd)/bin/:/usr/local/bin/ \
${IMG_alpine} sh