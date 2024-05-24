echo ./init-docker.sh <host> [port]
echo Examples:
echo    ./init-docker.sh root@localhost
echo    ./init-docker.sh root@ip.akash.network 30222

HOST=$1
USER=root

CONFIG_AKASH=config-akash
TO=$HOST:/$USER/.config-akash

set -x

scp -o StrictHostKeyChecking=no $CONFIG_AKASH $TO

scp -o StrictHostKeyChecking=no startup.sh $HOST:/app
