HOST=localhost
PORT=22
WALLET=wallet

echo Docker build

./docker-build.sh

install_files_on_docker_ready () {
  EXIT_CODE=1
  while [ $EXIT_CODE -ne 0 ]; do
    # check port
    nc -zv $HOST $PORT
    EXIT_CODE=$?
#    echo EXIT_CODE=$EXIT_CODE
    sleep 1
  done

  sleep 5

  ./deploy-files.sh $WALLET $HOST

  echo "============================="
  echo "Akash Docker container ready!"
  echo "============================="
}

echo Start install files watcher

install_files_on_docker_ready &
#install_files_on_docker_ready

echo Docker run

./docker-run.sh
