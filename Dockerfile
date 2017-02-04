FROM golang:1.8-alpine
MAINTAINER Jeff Haynie <jhaynie@gmail.com>

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		bash \
		gcc \
		musl-dev \
		libgit2-dev \
		openssl
