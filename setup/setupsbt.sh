#!/bin/bash

download()
{
  VERSION=${1:-0.13.9}

  echo "target sbt version ${VERSION}"
  TYPESAFE_REPO=https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch
  JAR_URL=$TYPESAFE_REPO/${VERSION}/sbt-launch.jar
  JAR=$HOME/bin/sbt-launch.jar

  echo "Downloading $JAR"

  curl -L -f -o $JAR $JAR_URL  
  if [ $? -ne 0 ]; then
    rm $JAR
    die "ERROR: $JAR not found"
  fi
}

updateProperties()
{
  OPTS=$HOME/dotfiles/sources/sbtopts.lst
  if [ -n $http_proxy ]; then
    proxyHost=`echo $http_proxy | awk -F: '{print $2}' | sed 's/\///g'`
    proxyPort=`echo $http_proxy | awk -F: '{print $3}' | sed 's/\///g'`

    sed "s/^#\(-D[^.]*\)\.proxyHost=.*$/\1.proxyHost=${proxyHost}/" -i $OPTS
    sed "s/^#\(-D[^.]*\)\.proxyPort=.*$/\1.proxyHost=${proxyPort}/" -i $OPTS
  fi
}

main()
{
  download $1
  updateProperties
}

main $1
