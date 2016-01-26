#!/bin/bash

RCDIR=~/dotfiles/rc

case `uname` in
  MINGW32*) LINKER=~/dotfiles/bin/msysln.sh ;;
  *) LINKER=ln;;
esac

cd $RCDIR
FILES=`find . -type f`

source ~/dotfiles/sources/mingw.source

cd ~
for file in $FILES
do
  mkdir -p `dirname $file`
  $LINKER ~/dotfiles/rc/$file $file
done

# 
$LINKER -s ~/dotfiles/bin ~/bin

