FROM        ubuntu:18.04

LABEL       author="denNorske" maintainer="den@ducky.rocks"

RUN         dpkg --add-architecture i386 \
            && apt-get update -qq\
            && apt-get install -qq ca-certificates wget\
            && useradd -d /home/container -m container



USER        container


ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
