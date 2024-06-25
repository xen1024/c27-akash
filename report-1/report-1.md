## provider.europlots.com rtx3090 512M
- Memory Requested: 2G
- Memory Allocated: 512M
- The initial script run normally
- 

## provider.europlots.com 3090 512M
- The initial script isn't launching
- miner killed
- rebooted after start miner

64um5b06h18336dd0qkp0hregs.ingress.europlots.com
```
2024-06-25 05:25:28.575 |       INFO       | Setting up bittensor objects. 
2024-06-25 05:25:28.575 |       INFO       | Wallet: wallet(default, default, ~/.bittensor/wallets/)
wandb: Currently logged in as: gojo89j. Use `wandb login --relogin` to force relogin
wandb: wandb version 0.17.3 is available!  To upgrade, please run:
wandb:  $ pip install wandb --upgrade
wandb: Tracking run with wandb version 0.16.6
wandb: Run data is saved locally in /app/neurons/wandb/run-20240625_052530-zj516nkr
wandb: Run `wandb offline` to turn off syncing.
wandb: Syncing run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj
wandb: ⭐️ View project at https://wandb.ai/neuralinternet/opencompute
wandb: 🚀 View run at https://wandb.ai/neuralinternet/opencompute/runs/zj516nkr
wandb:                                                                                
wandb: 🚀 View run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj at: https://wandb.ai/neuralinternet/opencompute/runs/zj516nkr
wandb: ⭐️ View project at: https://wandb.ai/neuralinternet/opencompute
wandb: Synced 4 W&B file(s), 0 media file(s), 0 artifact file(s) and 0 other file(s)
wandb: Find logs at: ./wandb/run-20240625_052530-zj516nkr/logs
wandb: wandb version 0.17.3 is available!  To upgrade, please run:
wandb:  $ pip install wandb --upgrade
wandb: Tracking run with wandb version 0.16.6
wandb: Run data is saved locally in /app/neurons/wandb/run-20240625_052535-zj516nkr
wandb: Run `wandb offline` to turn off syncing.
wandb: Resuming run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj
wandb: ⭐️ View project at https://wandb.ai/neuralinternet/opencompute
wandb: 🚀 View run at https://wandb.ai/neuralinternet/opencompute/runs/zj516nkr
Connection to 64um5b06h18336dd0qkp0hregs.ingress.europlots.com closed by remote host.
Connection to 64um5b06h18336dd0qkp0hregs.ingress.europlots.com closed.
```

## provider.medc1.com T4
T4
provider.medc1.com

b20mhhj5l1ah3apvvlkd9ulncg.ingress.medc1.com T4
- The initial script isn't launching
- rebooted after install files
- miner killed

```
++ python3 miner.py --netuid 15 --subtensor.network test --wallet.name default --wallet.hotkey default --logging.debug
2024-06-25 04:42:18.491 |       INFO       | Running miner for subnet: 15 on network: wss://entrypoint-finney.opentensor.ai:443 with config:
2024-06-25 04:42:18.495 |       INFO       | 
netuid: 15
auto_update: true
blacklist_exploiters: true
blacklist_hotkeys: []
blacklist_coldkeys: []
whitelist_hotkeys: []
whitelist_coldkeys: []
whitelist_unrecognized: false
validator_perform_hardware_query: true
validator_challenge_batch_size: 256
validator_specs_batch_size: 64
force_update_prometheus: false
validator_whitelist_updated_threshold: 60
miner_hashcat_path: hashcat
miner_hashcat_workload_profile: '3'
miner_hashcat_extended_options: ''
miner_whitelist_not_enough_stake: false
miner_whitelist_not_updated: false
miner_whitelist_updated_threshold: 60
subtensor:
  network: test
  chain_endpoint: wss://entrypoint-finney.opentensor.ai:443
  _mock: false
logging:
  debug: true
  trace: false
  record_log: false
  logging_dir: /root/.bittensor/miners/default/default/netuid15/miner
no_prompt: false
wallet:
  name: default
  hotkey: default
  path: ~/.bittensor/wallets/
axon:
  port: 8091
  ip: '[::]'
  external_port: null
  external_ip: null
  max_workers: 10
config: null
strict: false
no_version_checking: false
full_path: /root/.bittensor/miners/default/default/netuid15/miner

2024-06-25 04:42:18.496 |       INFO       | Setting up bittensor objects. 
2024-06-25 04:42:18.496 |       INFO       | Wallet: wallet(default, default, ~/.bittensor/wallets/)
wandb: Currently logged in as: gojo89j. Use `wandb login --relogin` to force relogin
wandb: wandb version 0.17.3 is available!  To upgrade, please run:
wandb:  $ pip install wandb --upgrade
wandb: Tracking run with wandb version 0.16.6
wandb: Run data is saved locally in /app/neurons/wandb/run-20240625_044219-938sb7st
wandb: Run `wandb offline` to turn off syncing.
wandb: Syncing run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj
wandb: ⭐️ View project at https://wandb.ai/neuralinternet/opencompute
wandb: 🚀 View run at https://wandb.ai/neuralinternet/opencompute/runs/938sb7st
wandb:                                                                                
wandb: W&B sync reduced upload amount by 4.4%             
wandb: 🚀 View run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj at: https://wandb.ai/neuralinternet/opencompute/runs/938sb7st
wandb: ⭐️ View project at: https://wandb.ai/neuralinternet/opencompute
wandb: Synced 4 W&B file(s), 0 media file(s), 2 artifact file(s) and 0 other file(s)
wandb: Find logs at: ./wandb/run-20240625_044219-938sb7st/logs
wandb: wandb version 0.17.3 is available!  To upgrade, please run:
wandb:  $ pip install wandb --upgrade
wandb: Tracking run with wandb version 0.16.6
wandb: Run data is saved locally in /app/neurons/wandb/run-20240625_044225-938sb7st
wandb: Run `wandb offline` to turn off syncing.
wandb: Resuming run miner-5HGSM8tDgeSdK533kwijeykioyYiJJCCeTJ7Ybmyas33uHxj
wandb: ⭐️ View project at https://wandb.ai/neuralinternet/opencompute
wandb: 🚀 View run at https://wandb.ai/neuralinternet/opencompute/runs/938sb7st
./startup.sh: line 23:  1427 Killed                  python3 miner.py --netuid $NETUID --subtensor.network $NETWORK --wallet.name $WALLET_NAME --wallet.hotkey $WALLET_HOTKEY --logging.debug
++ false
(bt) root@app-5b5896cc9f-d7rlx:/app# ps -A
    PID TTY          TIME CMD
      1 ?        00:00:00 sleep
   1221 pts/0    00:00:00 sh
   1231 pts/0    00:00:00 start-debug.sh
   1237 pts/0    00:00:08 node
   1238 pts/0    00:00:01 node
   1239 pts/0    00:00:00 node
   1240 pts/0    00:00:00 sshd
   1260 pts/0    00:00:00 tail
   1262 pts/0    00:00:00 tail
   1323 ?        00:00:00 sshd
   1334 pts/1    00:00:00 bash
   1500 ?        00:00:01 wandb-service(2 <defunct>
   1628 pts/1    00:00:00 ps
(bt) root@app-5b5896cc9f-d7rlx:/app# ps -A
    PID TTY          TIME CMD
      1 ?        00:00:00 sleep
   1221 pts/0    00:00:00 sh
   1231 pts/0    00:00:00 start-debug.sh
   1237 pts/0    00:00:08 node
   1238 pts/0    00:00:01 node
   1239 pts/0    00:00:00 node
   1240 pts/0    00:00:00 sshd
   1260 pts/0    00:00:00 tail
   1262 pts/0    00:00:00 tail
   1323 ?        00:00:00 sshd
   1334 pts/1    00:00:00 bash
   1500 ?        00:00:01 wandb-service(2 <defunct>
   1629 pts/1    00:00:00 ps
```


## provider.dcnorse.ddns.net p100 
p100 
US$79.74 / month

f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net
```
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[f4s0i6lrppcpbe354e2jrbng4o.ingress.dcnorse.ddns.net]: [Normal] [Sync] [Ingress] Scheduled for sync
[service]: [Normal] [Scheduled] [Pod] Successfully assigned rm31jdh3kfflk1qotk71su4kobpq5e1d4eqkli4dcnpl6/service-1-6595857fcb-xkc2r to node7
[service]: [Normal] [Pulled] [Pod] Container image "gojo89/compute-27-akash:0.2-dev" already present on machine
[service]: [Normal] [Created] [Pod] Created container service-1
[service]: [Normal] [Started] [Pod] Started container service-1
[service]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: service-1-6595857fcb-xkc2r
[service]: [Normal] [ScalingReplicaSet] [Deployment] Scaled up replica set service-1-6595857fcb to 1
```













