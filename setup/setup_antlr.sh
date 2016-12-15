#!/bin/bash

INSTALLDIR=~/tools/antlr
VERSION=${1:-4.5.3}

mkdir -p ${INSTALLDIR}
curl -L "http://antlr.org/download/antlr-${VERSION}-complete.jar" -o "${INSTALLDIR}/antlr-${VERSION}-complete.jar"

#echo "export PATH=\$PATH:~/tools/antlr" > ~/dotfiles/sources/antlr_gen.source

cat << EOF >  ~/dotfiles/sources/antlr_gen.source
export CLASSPATH=".:${INSTALLDIR}/antlr-${VERSION}-complete.jar:${CLASSPATH}"
alias antlr4='java -jar ${INSTALLDIR}/antlr-${VERSION}-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'
EOF
