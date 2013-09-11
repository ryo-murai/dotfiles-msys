#!/bin/bash

#
GRADLE_VER="1.7"
GRADLE_BASE=~/.gradle
GRADLE_ZIP=$GRADLE_BASE/gradle-bin.zip
GRADLE_PROP=$GRADLE_BASE/gradle.properties

download_extract()
{
  mkdir -p $GRADLE_BASE
  cd $GRADLE_BASE

  curl -L http://services.gradle.org/distributions/gradle-${GRADLE_VER}-bin.zip -o $GRADLE_ZIP

  unzip -u -qq $GRADLE_ZIP
  rm -f $GRADLE_ZIP
}

create_source()
{
  local src=~/dotfiles/sources/gradle_gen.source
  local cp="`/bin/ls -1 ${HOME}/.gradle/gradle-${GRADLE_VER}/lib/*.jar | tr '\n' ':'`."
  echo "export PATH=\$PATH:~/.gradle/gradle-${GRADLE_VER}/bin" > $src
  echo alias groovyConsole=\"java -classpath ${cp} groovy.ui.Console\" >> $src
}

setup_proxy()
{
  if [ -n $http_proxy ]; then
    proxyHost=`echo $http_proxy | awk -F: '{print $2}' | sed 's/\///g'`
    proxyPort=`echo $http_proxy | awk -F: '{print $3}' | sed 's/\///g'`

    sed "s/^#\(systemProp\.[^.]*\)\.proxyHost=.*$/\1.proxyHost=${proxyHost}/" -i $GRADLE_PROP
    sed "s/^#\(systemProp\.[^.]*\)\.proxyPort=.*$/\1.proxyPort=${proxyPort}/" -i $GRADLE_PROP
  fi
}

main()
{
  download_extract
  create_source
  setup_proxy
}

main

