FROM golang:1.8-alpine

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		libgit2-dev \
		git 
