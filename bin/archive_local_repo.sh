#!/bin/sh

if [ ! -d ./.git ]; then
  echo "run at a git repository"
  exit 4
fi

status=`git status |  grep 'Untracked files:'`
if [ $? -eq 0 ]; then
  echo "warning: working directory has untracked file(s)"
  git status
  sleep 3
fi

tgzfile=${1:-`basename $PWD`}
destdir=${2:-~/temp}

postfix=`date +%Y%m%d`
filepath=${destdir}/${tgzfile}_${postfix}.tgz

if [ -e $filepath ]; then
  echo "file: $filepath already exist. please check or specify other path / name"
  echo "usage: $0 [filename [dir]]"
  exit 6
fi

tar cvfz ${filepath} `git ls-files`

echo ""
echo "archive file created: $filepath"
