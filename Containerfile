FROM golang:1.11

MAINTAINER André Araujo <andre.araujo@extreme.digital>

RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
ADD https://github.com/beefsack/git-mirror/releases/download/v0.1.0/git-mirror_0.1.0_linux_amd64.tar.gz /go/src/app
RUN tar -zxvf git-mirror_0.1.0_linux_amd64.tar.gz
    && cp git-mirror_0.1.0_linux_amd64/git-mirror /go/src/app
ENTRYPOINT ["./git-mirror"]
CMD ["config.toml"]
