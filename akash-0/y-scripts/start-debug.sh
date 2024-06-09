#!/bin/sh

. ~/bt/bin/activate

python -m pip install --upgrade bittensor

run_web () {
  echo Run web livecomment
  livecomment --ws_port_client 8888 --path /app --dangerousCodeExecutionClient >/app/lc.log 2>&1 &
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
  sshd # 
}

run_neuron_stats () {
  echo Run neuron stats
  ./neuron-stats.sh  &
}

run_web
run_lc_log
run_app_log
run_sshd
run_neuron_stats

echo Docker sleep
sleep infinity
