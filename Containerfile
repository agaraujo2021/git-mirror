FROM golang:1.18 AS builder

COPY ./target /opt 

WORKDIR /app

# Toggle CGO based on your app requirement. CGO_ENABLED=1 for enabling CGO
RUN CGO_ENABLED=0 go build -ldflags '-s -w -extldflags "-static"' -o /opt *.go
# Use below if using vendor
# RUN CGO_ENABLED=0 go build -mod=vendor -ldflags '-s -w -extldflags "-static"' -o /app/appbin *.go

FROM scratch

MAINTAINER André Araujo <andre.araujo@extreme.digital>

WORKDIR /opt/

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
