# Alpine Linux golang build image

This was original forked from [blang/golang-alpine-docker](https://github.com/blang/golang-alpine-docker) but it only works with Go 1.5.

I basically re-worked it to use the latest official Golang Docker image but this image adds gcc so you can cross compile for Alpine Linux.

## Usage

Like the base `golang` image

```bash
docker run --rm -v "$PWD":/go/src/github.com/yourname/yourrepo -w /go/src/github.com/yourname/yourrepo blang/golang-alpine go build -v

docker run --rm -v "$PWD":/go/bin blang/golang-alpine go get github.com/yourname/yourrepo
```

## License

Public Domain
