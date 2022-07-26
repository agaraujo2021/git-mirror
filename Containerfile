FROM alpine:3.15

MAINTAINER André Araujo <andre.araujo@extreme.digital>

COPY ./target /opt 

WORKDIR /opt/

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
