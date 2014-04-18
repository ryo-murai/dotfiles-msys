#!/bin/bash

tooldir=$HOME/tools/difftools

mkdir -p $tooldir

url=https://tortoisesvn.googlecode.com/svn/trunk/contrib/diff-scripts

for tool in diff-doc.js diff-ppt.js diff-xls.js 
do
  curl -L "$url/$tool" -o $tooldir/$tool
done
