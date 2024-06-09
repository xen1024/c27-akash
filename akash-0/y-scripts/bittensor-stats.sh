#!/bin/sh

LLFILE=/app/BITTENSOR-STATS.sh

bt () {
 echo "> btcli $@"
 btcli $@
 echo
}

while [ : ]
do
  LAST_UPDATE="Last update: `date`"
  NODE_PROCS=`ps -aux|grep "[n]ode "`

  echo "
  # Bittensor [
  # Wallets [
  # list [
`bt wallet list`
  # list ]
  # balances test [
`bt wallet balance --all --subtensor.network test`
  # balances test ]
  # balances finney [
`bt wallet balance --all --subtensor.network finney`
  # balances finney ]
  # Wallets ]
  # Bittensor ]
  " > $LLFILE


  sleep 30
done
