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

dirname=${1:-`basename $PWD`}
destdir=${2:-~/temp}

postfix=`date +%Y%m%d`
destdir=${destdir}/${dirname}_${postfix}/

git checkout-index -a -f --prefix=${destdir}

echo ""
echo "exported to: $destdir"
