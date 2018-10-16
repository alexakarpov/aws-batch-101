FROM amazonlinux:latest
RUN yum -y install which aws-cli
WORKDIR /tmp
ADD credentials .
ADD scripts
COPY run.sh .
USER nobody
ENTRYPOINT ["run.sh"]
