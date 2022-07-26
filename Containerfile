FROM openshift/go-14-rhel7
MAINTAINER André Araujo <andre.araujo@extreme.digital>

COPY ./target /opt 
WORKDIR /opt 

RUN yum install snapd \
    && snap install go --classic \
    && ln -s /var/lib/snapd/snap /snap  \
    && export PATH=$PATH:/var/lib/snapd/snap/bin \
    && yum clean all
    
ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
