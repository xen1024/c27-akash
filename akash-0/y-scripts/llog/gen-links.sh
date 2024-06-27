set -x

. ~/config-debug

: ${EXTIP:=`curl https://checkip.amazonaws.com`}

echo "
# Debug Akash [
debug http://$EXTIP:$PORT2/

debug http://$EXTIP:$PORT3/
# Debug Akash ]
"