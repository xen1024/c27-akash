#!/bin/sh

run_web () {
  livecomment --ws_port_client 8888 --path /app --dangerousCodeExecutionClient >/app/lc.log 2>&1 &
}

run_log () {
  frontail /app/lc.log --port 8400 -n 1000 >/app/ft.log 2>&1 &
}

run_web
run_log

./neuron-stats.sh
