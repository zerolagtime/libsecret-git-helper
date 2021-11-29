FROM ubuntu:21.04 as build
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get -qq update && \
    apt-get -y -qq install make build-essential

ADD git-credential-libsecret.c /src/git-credential-libsecret.c
ADD Makefile /src/Makefile
RUN mkdir /src/bin/ && \
    chown -R 1000 /src /src/bin && \
    useradd -d /src --no-create-home --uid 1000 build
RUN apt-get -y -qq install libsecret-1-dev libglib2.0-dev libpthread-stubs0-dev
USER build
WORKDIR /src
RUN make
CMD cp /src/git-credential-libsecret /src//bin/git-credential-libsecret
