FROM golang:1.11

MAINTAINER André Araujo <andre.araujo@extreme.digital>

RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app

COPY ./target /opt
WORKDIR /opt

ENTRYPOINT ["./git-mirror"]
CMD ["config.toml"]
