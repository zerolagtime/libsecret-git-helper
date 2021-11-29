#!/bin/sh
cp /usr/share/doc/git/contrib/credential/libsecret/* .

docker build -t libsecret-git-tool:latest .
docker run -v `pwd`:/src/bin libsecret-git-tool:latest 
ls -l git-credential-libsecret
