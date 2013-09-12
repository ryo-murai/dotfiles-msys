#!/bin/bash

RCDIR=~/dotfiles/rc

cd $RCDIR
FILES=`find . -type f`

source ~/dotfiles/sources/mingw.source

cd ~
for file in $FILES
do
  mkdir -p `dirname $file`
  ln ~/dotfiles/rc/$file $file
done

