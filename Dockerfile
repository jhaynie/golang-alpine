FROM golang:1.11-alpine

RUN apk add --no-cache --virtual .build-deps \
		alpine-sdk \
      cmake \
      sudo \
		libssh2 libssh2-dev\
		git 
