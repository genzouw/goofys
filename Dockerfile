FROM golang:1.14rc1-alpine3.11 as build-stage
RUN apk add --no-cache \
  git \
  ca-certificates \
  ;
RUN CGO_ENABLED=0 go get github.com/kahing/goofys && \
    go build -o /app/goofys github.com/kahing/goofys

FROM alpine:3.11.3
LABEL maintainer "genzouw <genzouw@gmail.com>"
RUN apk add --no-cache \
  fuse \
  ca-certificates \
  ;
COPY --from=build-stage /app/goofys /usr/bin/goofys
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
