FROM golang:1.18-bullseye

MAINTAINER André Araujo <andre.araujo@extreme.digital>


RUN go install github.com/beego/bee/v2@latest

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

COPY ./target /opt
WORKDIR /opt

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
