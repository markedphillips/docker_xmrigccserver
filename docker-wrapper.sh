#!/bin/bash

cd /

command="$1"
server="xmrigserver"
daemon="xmrigdaemon"
shopt -s nocasematch
case "$command" in
  $server )
        exec /xmrigCC/xmrigServer "${@:2}"
        ;;
  $daemon )
        exec /xmrigCC/xmrigDaemon "${@:2}"
        ;;
 *) echo "Usage: XMRigServer [params] or XMRigDaemon [params]";;
esac



