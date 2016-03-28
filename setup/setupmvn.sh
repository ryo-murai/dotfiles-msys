#!/bin/bash

MIRRORURL=http://ftp.yz.yamagata-u.ac.jp/pub/network
VERSION=${1:-3.3.9}

cd ~/tools/
curl -L "${MIRRORURL}/apache/maven/maven-3/3.3.9/binaries/apache-maven-${VERSION}-bin.tar.gz" | tar xvfz -

echo "export PATH=\$PATH:~/tools/apache-maven-${VERSION}/bin" > ~/dotfiles/sources/mvn_gen.source

