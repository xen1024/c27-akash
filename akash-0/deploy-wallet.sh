usage () {
  echo "./deploy-wallet.sh <walletname> <host> [port]"
  echo "Examples:"
  echo "   ./deploy-wallet.sh root@localhost"
  echo "   ./deploy-wallet.sh root@ip.akash.network 30222"
}

if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi

WALLET=$1

USER=root
HOST=$USER@$2
PORT=${3:+-P $3}

TARGET_PATH=/root/.bittensor/wallets/default

set -x
scp $PORT -r -o StrictHostKeyChecking=no $WALLET/* $HOST:$TARGET_PATH
