
###################################
# REQUIRED BY OUR GITHUB ACTION CI
###################################
ARG VERSION="3.11"
ARG APP_NAME="alpine"
ARG GIT_PROJECT_NAME="alpine"

ARG DOCKERHUB_USER="devmtl"
ARG GITHUB_USER="firepress"
ARG GITHUB_ORG="firepress-org"
ARG GITHUB_REGISTRY="registry"

ARG GIT_REPO_DOCKERFILE="https://github.com/firepress-org/alpine"
ARG GIT_REPO_SOURCE="https://github.com/alpinelinux/docker-alpine"

# Those vars are used broadly outside this Dockerfile
# Github Action CI and release script (./utility.sh) is consuming these variables.
# GNU v3 | Please credit my work if you are re-using some of it :)
# by Pascal Andy | https://pascalandy.com/blog/now/

# ----------------------------------------------
# BASE IMAGE VERSIONNING LAYER
# ----------------------------------------------
FROM alpine:${VERSION} AS myalpine
#  Credit to Tõnis Tiigi / https://bit.ly/2RoCmvG

# ----------------------------------------------
# UPGRADE LAYER
# The point is to keep trace of logs our CI
# ----------------------------------------------
FROM myalpine AS what-to-upgrade
RUN apk update && apk upgrade

# ----------------------------------------------
# FINAL LAYER
# ----------------------------------------------
FROM myalpine AS final

ARG APP_NAME
ARG VERSION
ARG GIT_REPO

ENV APP_NAME="${APP_NAME}"
ENV VERSION="${VERSION}"
ENV GIT_REPO_DOCKERFILE="${GIT_REPO_DOCKERFILE}"

ENV CREATED_DATE="$(date "+%Y-%m-%d_%HH%Ms%S")"
ENV SOURCE_COMMIT="$(git rev-parse --short HEAD)"


RUN set -eux && \
echo "# Install common utilities" && \
    apk --update --no-cache add \
    bash \
    wget \
    curl \
    git \
    openssl \
    ca-certificates \
    tzdata \
    upx && \
    \
echo "# Set time zone" && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime  && \
    echo "America/New_York" > /etc/timezone                 && \
    apk del tzdata                                          && \
    # update time zone (but crash default official docker tests)
    \
echo "# Install custom apps" && \
    apk --update --no-cache add \
    gzip \
    tar \
    unzip \
    zip \
    tini \
    nano \
    openssh-client \
    jq \
    pwgen \
    apache2-utils

# Best practice credit: https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="${APP_NAME}"                                              \
      org.opencontainers.image.version="${VERSION}"                                             \
      org.opencontainers.image.description="See README.md"                                      \
      org.opencontainers.image.authors="Pascal Andy https://firepress.org/en/contact/"          \
      org.opencontainers.image.created="${CREATED_DATE}"                                        \
      org.opencontainers.image.revision="${SOURCE_COMMIT}"                                      \
      org.opencontainers.image.source="${GIT_REPO_DOCKERFILE}"                                  \
      org.opencontainers.image.licenses="GNUv3. See README.md"                                  \
      org.firepress.image.user="root"                                                           \
      org.firepress.image.alpineversion="{VERSION}"                                             \
      org.firepress.image.field1="not_set"                                                      \
      org.firepress.image.field2="not_set"                                                      \
      org.firepress.image.schemaversion="1.0"

# Copy my bash scripts
COPY bin /usr/local/bin

WORKDIR /usr/local/bin
