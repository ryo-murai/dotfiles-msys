#!/bin/bash

JDKPATH=$1

if [ -z "$JDKPATH" ]; then
    echo "Usage: $0 jdk_path"
    exit 1
fi


read -d '' RES <<EOF
if [ -z \$JAVA_HOME ]; then
  export JAVA_HOME=${JDKPATH}
fi

if [ -z `which java` ]; then
  export PATH=\$PATH:\$JAVA_HOME/bin
fi
EOF

echo "$RES" > ~/dotfiles/sources/java_gen.source
