#!/bin/sh

#curl -s get.gvmtool.net | bash

sed 's/^\(gvm_suggestive_selfupdate=\)true$/\1false/' -i ~/.gvm/etc/config
