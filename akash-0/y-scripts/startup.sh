# compute-startup.sh

# Import config
. ~/.config-akash

set -x

# Install ssh key at startup
if [ $AKASH ]; then
  echo Configuring ssh key
  echo "ssh-rsa $SSH_PUBKEY root" > /root/.ssh/authorized_keys
fi

# WanDB
echo Configuring WanDB
echo WANDB_KEY=$WANDB_KEY
echo "machine api.wandb.ai
  login user
  password $WANDB_KEY" > ~/.netrc

run_miner () {
  cd neurons
  python3 miner.py \
    --netuid $NETUID \
    --subtensor.network $NETWORK  \
    --wallet.name $WALLET_NAME \
    --wallet.hotkey $WALLET_HOTKEY \
    --logging.debug 
}

run_validator () {
  cd neurons
  python3 validator.py \
    --netuid $NETUID \
    --subtensor.network $NETWORK  \
    --wallet.name $WALLET_NAME \
    --wallet.hotkey $WALLET_HOTKEY \
    --logging.debug 
}

if [ ! -f /root/.bittensor/wallets/default/coldkey ]; then
  echo No wallet
  exit 1
fi

if $MINER ; then
  echo Starting miner
  run_miner
fi

if $VALIDATOR ; then
  echo Starting validator
  run_validator
fi
