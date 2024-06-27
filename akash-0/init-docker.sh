usage () {
  echo "./init-docker.sh <host> [port]"
  echo "Examples:"
  echo "   ./init-docker.sh root@localhost"
  echo "   ./init-docker.sh root@ip.akash.network 30222"
}

if [ "$#" -eq 0 ]; then
  usage
  exit 1
fi


USER=root
HOST=$USER@$1
PORT=${2:+-P $2}

CONFIG_AKASH=config-akash
TO=$HOST:/$USER/.config-akash

set -x

scp $PORT -o StrictHostKeyChecking=no $CONFIG_AKASH $TO

scp $PORT -o StrictHostKeyChecking=no y-scripts/startup.sh y-scripts/llog/gen-links.sh $HOST:/app

scp $PORT -o StrictHostKeyChecking=no y-scripts/install0.sh y-scripts/neuron-stats.sh y-scripts/bittensor-stats.sh y-scripts/start-debug.sh $HOST:/$USER

