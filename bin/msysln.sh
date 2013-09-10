#!/bin/bash

print_usage () {
    echo "Usage: $0 TARGET [LINK_NAME]"
}

case "$#" in
    [1,2])
        TARGET=$1
        LINKNAME=${2:-`basename $TARGET`}
        ;;
    *)
        print_usage
        exit 1
        ;;
esac

if [ -d "$TARGET" ]; then
  OPT="/D"
fi

#echo "creating symlink for $TARGET to $LINKNAME"

TARGETPATH=`echo "$TARGET" | sed -r 's/\//\\\/g'`
LINKPATH=`echo "$LINKNAME" | sed -r 's/\//\\\/g'`

echo "mklink $OPT $LINKPATH $TARGETPATH"
cmd //c "mklink $OPT $LINKPATH $TARGETPATH"
