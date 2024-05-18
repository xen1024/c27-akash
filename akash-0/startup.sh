echo "$SSH_PUBKEY" > /root/.ssh/authorized_keys

run_miner () {
  cd neurons
  python -m miner.py 
    --netuid $NETUID  # The subnet id you want to connect to
    --subtensor.network $NETWORK  # blockchain endpoint you want to connect
    --wallet.name $WALLET_NAME # name of your wallet
    --wallet.hotkey $WALLET_HOTKEY # hotkey name of your wallet
    --logging.debug # Run in debug mode, alternatively --logging.trace for trace mode
}

run_validator () {
  cd neurons
  python -m validator.py 
    --netuid $NETUID # The subnet id you want to connect to
    --subtensor.network $NETWORK # blockchain endpoint you want to connect
    --wallet.name $WALLET_NAME  # name of your wallet
    --wallet.hotkey $WALLET_HOTKEY # hotkey name of your wallet
    --logging.debug # Run in debug mode, alternatively --logging.trace for trace mode
}

if [ $MINER ]; then
  echo Starting miner
  run_miner
fi

if [ $VALIDATOR ]; then
  echo Starting validator
  run_validator
fi






