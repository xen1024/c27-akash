echo "./deploy-files.sh <walletname> <host> [port]"
echo Examples:
echo    ./deploy-files.sh root@localhost
echo    ./deploy-files.sh root@ip.akash.network 30222

WALLET=$1
HOST=$2
TARGET_PATH=/root/.bittensor/wallets/default

echo New design:

echo * Deploy config

./init-docker.sh $1 $2

echo * Deploy wallet

./deploy-wallet.sh $@

