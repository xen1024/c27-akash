EXTIP=`curl https://checkip.amazonaws.com`
echo "
# Debug Akash [
debug http://$EXTIP:8400/

debug http://$EXTIP:8401/
# Debug Akash ]
"