HOST=localhost
PORT=22
WALLET=wallet

echo Docker build

./docker-build.sh

install_files_on_docker_ready () {
  EXIT_CODE=1
  sleep 5
  while [ $EXIT_CODE -ne 0 ]; do
    # check port - bad
#    nc -zv $HOST $PORT
    # check ssh connection
     scp -o StrictHostKeyChecking=no root@localhost:/root/.ssh/authorized_keys /dev/null 2>/dev/null
     EXIT_CODE=$?
#    echo EXIT_CODE=$EXIT_CODE
    sleep 1
  done

#  sleep 15

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
