FROM golang:1.13-alpine

MAINTAINER André Araujo <andre.araujo@extreme.digital>

COPY --from=golang:1.13-alpine /usr/local/go/ /usr/local/go/
 
ENV PATH="/usr/local/go/bin:${PATH}"

COPY ./target /opt
WORKDIR /opt

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
