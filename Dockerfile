FROM alpine:latest
WORKDIR /tmp
RUN apk add postgresql
ADD credentials .
ADD scripts .
COPY run.sh .
USER nobody
ENTRYPOINT ["./run.sh"]
