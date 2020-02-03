#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

# UAT (User Acceptance Testing)
# By Pascal Andy https://twitter.com/askpascalandy 
# 2018-04-01_16h44

###############################################################################
# Run tests
###############################################################################

CTN_NAME="alpinebase-uat"
#IMG_TO_TEST="devmtl/alpine:stable"
#IMG_TO_TEST="devmtl/alpine:3.11"
IMG_TO_TEST="devmtl/alpine:edge_3.11_3a14e3e_2020-02-03_00H19s16"


echo && echo "--- Unit Test for image: <$IMG_TO_TEST> - START ---"; echo;

echo && echo "--- TEST 01 ---";
echo && docker run --rm -it --name "$CTN_NAME" \
"$IMG_TO_TEST" sh -c \
'uname -a'

echo && echo "--- TEST 02 ---";
echo && docker run --rm -it --name "$CTN_NAME" \
"$IMG_TO_TEST" sh -c \
'cat /etc/apk/repositories'

echo && echo "--- TEST 03 ---";
echo && docker run --rm -it \
"$IMG_TO_TEST" sh -c \
'ps aux'

echo && echo "--- TEST 04 ---";
echo && docker run --rm -it \
"$IMG_TO_TEST" sh -c \
'ls -AlhF /'

echo && echo "--- TEST 05 ---";
echo && docker run --rm -it \
"$IMG_TO_TEST" sh -c \
'date'

echo && echo "--- TEST 06 ---";
echo && docker run --rm -it \
"$IMG_TO_TEST" sh -c \
'random.sh'

echo && echo "--- Unit Test for image: <$IMG_TO_TEST> - END ---";
