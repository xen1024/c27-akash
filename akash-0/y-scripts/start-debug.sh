#!/bin/sh

. ~/bt/bin/activate

env > ~/env11.log

echo "Upgrade Bittensor"
python -m pip install --upgrade bittensor

run_web () {
  echo Run web livecomment $PORT0 $PORT1
#  livecomment --ws_port_client 8888 --path /app --dangerousCodeExecutionClient >/app/lc.log 2>&1 &
  livecomment --ws_port_client $PORT1 --path /app --dangerousCodeExecutionClient >/app/lc.log 2>&1 &
}

run_lc_log () {
  echo Run frontail-1
  frontail /app/lc.log --port 8400 -n 10000 >/app/ft.log 2>&1 &
}

run_app_log () {
  echo Run frontail-2
  frontail /app/app.log --port 8401 -n 10000 >/app/app.log 2>&1 &
}

run_sshd () {
  echo Run sshd
  #sshd # 
  /usr/sbin/sshd -D
}

run_stats () {
  echo Run neuron stats
  ./neuron-stats.sh  &
  echo Run bittensor stats
  ./bittensor-stats.sh  &
}

run_sshd
run_stats

/app/gen-links.sh >/app/Akash-links-generated.sh

set -x

while [ -z "${PORT0}" ]; do
  . ~/config-debug
  sleep 1
done

run_web
run_lc_log
run_app_log


echo Docker sleep
sleep infinity
