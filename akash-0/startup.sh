echo "$SSH_PUBKEY" > /root/.ssh/authorized_keys

if [ $MINER ]; then
  echo Starting miner
fi

if [ $VALIDATOR ]; then
  echo Starting validator
fi






