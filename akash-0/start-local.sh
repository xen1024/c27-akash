HOST=localhost
PORT=22
WALLET=wallet

benchmark_start () {
  start_time=$(date +%s)
}

benchmark_end () {
  end_time=$(date +%s)
  time_difference=$((end_time - start_time))
  echo "Time: $time_difference seconds"
}

benchmark_start

echo Docker build

/usr/bin/time -h ./docker-build.sh

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

  benchmark_end

  echo "============================="
  echo "Akash Docker container ready!"
  echo "============================="
}

echo Start install files watcher

install_files_on_docker_ready &
#install_files_on_docker_ready

echo Docker run

./docker-run.sh
