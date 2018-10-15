FROM amazonlinux:latest
RUN yum -y install which aws-cli
WORKDIR /tmp
ADD credentials .
USER nobody
ENTRYPOINT ["run.sh"]
