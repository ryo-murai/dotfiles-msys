#!/bin/bash

proxyHost=${1:-localhost}
proxyPort=${2:-8880}

read -d '' SCRIPT <<EOF
export http_proxy=http://${proxyHost}:${proxyPort}
export https_proxy=http://${proxyHost}:${proxyPort}
EOF

echo "$SCRIPT" > $HOME/dotfiles/sources/proxy_gen.source
