#!/usr/bin/env bash
set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

IMG_alpine="devmtl/alpine:stable"

#echo && echo && docker run --rm -it \
#"$IMG_NAME" sh -c \
#'ps aux'

#echo && echo && docker run --rm -it \
#"$IMG_NAME" sh -c \
#'uname.sh'

echo ${IMG_alpine}; echo

echo && echo && docker run --rm -it \
${IMG_alpine} sh -c \
'random.sh'

echo && echo && docker run --rm -it \
-v $(pwd)/bin/:/usr/local/bin/ \
${IMG_alpine} sh