FROM alpine

MAINTAINER André Araujo <andre.araujo@extreme.digital>

WORKDIR /opt
COPY . /opt
ADD https://github.com/beefsack/git-mirror/releases/download/v0.1.0/git-mirror_0.1.0_linux_amd64.tar.gz /opt
RUN tar -zxvf git-mirror_0.1.0_linux_amd64.tar.gz
    && cp git-mirror_0.1.0_linux_amd64/git-mirror /opt

CMD ["./git-mirror","config.toml"]
