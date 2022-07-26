FROM centos8

MAINTAINER André Araujo <andre.araujo@extreme.digital>

RUN yum update -y \
 && yum install -y git \
 && yum install -y curl \ 
 && yum clean all 

COPY ./target /opt 

WORKDIR /opt/

ENTRYPOINT ["/opt/git-mirror"]
CMD ["config.toml"]
