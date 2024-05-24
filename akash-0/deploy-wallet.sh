echo "./deploy-wallet.sh <walletname> <host> [port]"
echo Examples:
echo    ./deploy-wallet.sh root@localhost
echo    ./deploy-wallet.sh root@ip.akash.network 30222

WALLET=$1
HOST=$2
TARGET_PATH=/root/.bittensor/wallets/default
set -x
scp -r -o StrictHostKeyChecking=no $WALLET $HOST:$TARGET_PATH
