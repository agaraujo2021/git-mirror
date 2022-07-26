FROM openshift/go-14-rhel7
MAINTAINER André Araujo <andre.araujo@extreme.digital>

COPY ./target /opt 
WORKDIR /opt 

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
