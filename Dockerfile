# ----------------------------------------------
# REQUIRED BY OUR GITHUB ACTION CI
# ----------------------------------------------
# These vars are used outside this Dockerfile by our CI.
ARG VERSION="3.12"
ARG RELEASE="3.12"
ARG APP_NAME="alpine"
ARG GIT_PROJECT_NAME="alpine"

ARG DOCKERHUB_USER="devmtl"
ARG GITHUB_USER="firepress"
ARG GITHUB_ORG="firepress-org"
ARG GITHUB_REGISTRY="registry"

ARG GIT_REPO_DOCKERFILE="https://github.com/firepress-org/alpine"

###################################
# REQUIRED BY THIS SPECIFIC BUILD (start you Dockerile from here if any)
###################################
ARG GIT_REPO_SOURCE="https://github.com/alpinelinux/docker-alpine"

# ----------------------------------------------
# multistage #1)
#   manage base image(s) versioning
#   credit to Tõnis Tiigi / https://bit.ly/2RoCmvG
# ----------------------------------------------
FROM alpine:${VERSION} AS myalpine

# ----------------------------------------------
# multistage #2)
#   build the core
# ----------------------------------------------
FROM myalpine AS alpine-prebuild

ARG VERSION
ARG APP_NAME
ARG GIT_REPO
ARG GIT_REPO_DOCKERFILE
ARG GIT_REPO_SOURCE

ENV APP_NAME="${APP_NAME}"
ENV VERSION="${VERSION}"
ENV GIT_REPO_DOCKERFILE="${GIT_REPO_DOCKERFILE}"
ENV GIT_REPO_SOURCE="${GIT_REPO_SOURCE}"

ENV CREATED_DATE="$(date "+%Y-%m-%d_%HH%Ms%S")"
ENV SOURCE_COMMIT="$(git rev-parse --short HEAD)"

RUN set -eux && \
echo "### Install common utilities" && \
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
echo "### Set time zone" && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime  && \
    echo "America/New_York" > /etc/timezone                 && \
    apk del tzdata                                          && \
    # update time zone (but crash default official docker tests)
    \
echo "### Install custom apps" && \
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
    apache2-utils && \
echo "### clean cache" && \
    rm -rvf /var/cache/apk/*;

# Best practice credit: https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="${APP_NAME}"                                              \
      org.opencontainers.image.version="${VERSION}"                                             \
      org.opencontainers.image.description="See README.md"                                      \
      org.opencontainers.image.authors="Pascal Andy https://firepress.org/en/contact/"          \
      org.opencontainers.image.dockerfile="${GIT_REPO_DOCKERFILE}"                              \
      org.opencontainers.image.source="${GIT_REPO_SOURCE}"                                      \
      org.opencontainers.image.created="${CREATED_DATE}"                                        \
      org.opencontainers.image.revision="${SOURCE_COMMIT}"                                      \
      org.opencontainers.image.licenses="GNUv3. See README.md"                                  \
      org.firepress.image.user="root"                                                           \
      org.firepress.image.field1="not_set"                                                      \
      org.firepress.image.field2="not_set"                                                      \
      org.firepress.image.schemaversion="1.0"

COPY bin /usr/local/bin
WORKDIR /usr/local/bin

# ----------------------------------------------
# multistage #3)
#   If a package crash on further layers, we don't know
#   which one did crash. This layer reveal package(s)
#   versions and keep a trace in the CI's logs.
# ----------------------------------------------
FROM alpine-prebuild AS alpine-upgraded
RUN set -eux && \
    apk update && \
    apk upgrade && \
    rm -rv /var/cache/apk/*

# ----------------------------------------------
# multistage #4)
# ----------------------------------------------
FROM alpine-prebuild AS alpine-final

# GNU v3 by Pascal Andy | https://pascalandy.com/blog/now/
# https://twitter.com/askpascalandy | Please credit my work if you are re-using some of it
