FROM debian:stable-slim

RUN apt-get update && apt-get -y install curl && apt-get clean &&\
    curl -Lo ssosync.tgz https://github.com/awslabs/ssosync/releases/download/v2.0.2/ssosync_Linux_x86_64.tar.gz &&\
    tar -xzf ssosync.tgz -C /tmp &&\
    cp /tmp/ssosync /usr/bin/ &&\
    chmod 755 /usr/bin/ssosync &&\
    rm -Rf ssosync.tgz /tmp/*

ENTRYPOINT ["/usr/bin/ssosync"]
