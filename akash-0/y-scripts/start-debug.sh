#!/bin/sh

run_web () {
  livecomment --ws_port_client 8888 --path /app --dangerousCodeExecutionClient >/app/lc.log 2>&1 &
}

run_lc_log () {
  frontail /app/lc.log --port 8400 -n 10000 >/app/ft.log 2>&1 &
}

run_app_log () {
  frontail /app/app.log --port 8401 -n 10000 >/app/app.log 2>&1 &
}

run_web
run_lc_log
run_app_log

sshd # bug? not start from docker CMD

./neuron-stats.sh 
