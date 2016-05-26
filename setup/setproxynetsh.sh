#!/bin/bash

#
# execute `netsh winhttp import proxy source=ie`
# before run this script ...
#

PROXYCONF_FILE=/tmp/winhttpconfig-utf8.txt

netsh winhttp show proxy | iconv -f sjis -t utf-8 > $PROXYCONF_FILE

PROXYHOST=`grep "プロキシ サーバー" $PROXYCONF_FILE | awk -F: '{print $2}' | sed 's/ //g'`
PROXYPORT=`grep "プロキシ サーバー" $PROXYCONF_FILE | awk -F: '{print $3}' | sed 's/ //g'`

NOPROXY=`grep "バイパス一覧" $PROXYCONF_FILE | awk -F: '{print $2}' | sed 's/ //g' | sed 's/;/,/g'`


read -d '' SCRIPT <<EOF
export http_proxy=http://${PROXYHOST}:${PROXYPORT}
export https_proxy=http://${PROXYHOST}:${PROXYPORT}
export no_proxy=${NOPROXY}
EOF

echo "$SCRIPT" > $HOME/dotfiles/sources/proxy_gen.source

rm -f ${PROXYCONF_FILE}
