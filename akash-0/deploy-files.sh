usage () {
  echo "./deploy-files.sh <walletname> <host> [port]"
  echo "Examples:"
  echo "   ./deploy-files.sh wallet localhost"
  echo "   ./deploy-files.sh wallet ip.akash.network 30222"
}

if [ "$#" -lt "2" ]; then
  usage
  exit 1
fi

WALLET=$1
HOST=$2
PORT=$3
TARGET_PATH=/root/.bittensor/wallets/default

echo $WALLET $HOST $PORT

echo "* Deploy config"

./init-docker.sh $HOST $PORT

echo "* Deploy wallet"

./deploy-wallet.sh $@
