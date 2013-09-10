#!/bin/bash

VERSION=${1:-0.12.3}

echo "target sbt version ${VERSION}"
TYPESAFE_REPO=http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch
JAR_URL=$TYPESAFE_REPO/${VERSION}/sbt-launch.jar
JAR=$HOME/bin/sbt-launch.jar

echo "Downloading $JAR"

curl -f -o $JAR $JAR_URL  
if [ $? -ne 0 ]; then
    rm $JAR
    die "ERROR: $JAR not found"
fi

OPTS=$HOME/dotfiles/sources/sbtopts.lst
if [ -n $http_proxy ]; then
  proxyHost=`echo $http_proxy | awk -F: '{print $2}' | sed 's/\///g'`
  proxyPort=`echo $http_proxy | awk -F: '{print $3}' | sed 's/\///g'`

  sed "s/^#-Dhttp\.proxyHost=.*\$/-Dhttp.proxyHost=${proxyHost}/"  -i $OPTS
  sed "s/^#-Dhttp\.proxyPort=.*\$/-Dhttp.proxyPort=${proxyPort}/" -i $OPTS 
  sed "s/^#-Dhttps\.proxyHost=.*\$/-Dhttps.proxyHost=${proxyHost}/" -i $OPTS 
  sed "s/^#-Dhttps\.proxyPort=.*\$/-Dhttps.proxyPort=${proxyPort}/" -i $OPTS 
fi

