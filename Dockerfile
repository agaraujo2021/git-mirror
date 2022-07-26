FROM golang:1.11

MAINTAINER André Araujo <andre.araujo@extreme.digital>

RUN mkdir -p /go/src/github.com/openshift/golang-ex

WORKDIR /go/src/github.com/openshift/golang-ex

COPY . /go/src/github.com/openshift/golang-ex

ADD https://github.com/beefsack/git-mirror/releases/download/v0.1.0/git-mirror_0.1.0_linux_amd64.tar.gz /go/src/github.com/openshift/golang-ex

RUN tar -zxvf git-mirror_0.1.0_linux_amd64.tar.gz
    && cp git-mirror_0.1.0_linux_amd64/git-mirror /opt

CMD ["./git-mirror","config.toml"]

