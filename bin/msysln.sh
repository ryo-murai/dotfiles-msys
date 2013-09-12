#!/bin/bash

print_usage () {
  read -d '' USAGE <<EOF
Usage: $0 [options] TARGET [LINK_NAME]

 options:
  -s, --symbolic              make symbolic links instead of hard links
      --help                  display this help and exit

  * other options are not supported *

EOF

  echo "$USAGE"
}

get_nativepath() {
  echo "$1" | sed -r 's/^\/([a-zA-Z])\//\1:\\/' | sed -r 's/\//\\/g'
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -s|--symbolic)
      # default behavior
      shift
      ;;

    --help)
      print_usage
      exit 0
      ;;

    -*)
      print_usage
      exit 1
      ;;

    *)
      TARGET=$1
      LINKNAME=${2:-`basename $TARGET`}
      shift
      shift
      ;;
  esac
done
      
if [ -z "$TARGET" ]; then
  print_usage
  exit 1
fi

if [ ! -e "$TARGET" ]; then
  echo "$0: accessing \"$TARGET\": No such file or directory" >&2
  exit 2
fi

if [ -d "$TARGET" ]; then
  OPT="/D"
fi

if [ -d "$LINKNAME" ]; then
  LINKNAME="$LINKNAME/"`basename $TARGET`
fi

echo "creating symlink for $TARGET to $LINKNAME"

TARGETPATH=`get_nativepath "$TARGET"`
LINKPATH=`get_nativepath "$LINKNAME"`

echo "mklink $OPT $LINKPATH $TARGETPATH"
cmd //c "mklink $OPT $LINKPATH $TARGETPATH"
