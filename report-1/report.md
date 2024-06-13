# Akash testing report

## Akash Issues
Akash Issues
- No GPU providers with persistent storage

## Akash Providers
Providers:
- provider.medc1.com (rtx4090)
- pcgameservers.com (rtx4090)
- akash.pub (rtx4090)
- provider.akashprovid.com (rtx3090)

### a40
No A40 on Akash
### a100
No A100 on Akash

### rtx4090
Provider: pcgameservers.com 
  - issue with reboot while install nvidia driver (asked on Akash discord)
    apt-get -y install -y cuda-drivers
  - docker CMD not work
u63658qf4la4d58t8ue0654es0.ingress.pdx.nb.akash.pub
  - can''t start docker container
Provider: provider.medc1.com
92644sthu1flfeos20n6ajq8uc.ingress.medc1.com
  - wrong docker container? no cuda-drivers.deb and pre. Maybe old?
  - just rebooted after some time, all downloads is lost
  - reboot after dpkg error

### rtx3090
provider.akashprovid.com
7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com
  - can''t start docker container


# 92644sthu1flfeos20n6ajq8uc.ingress.medc1.com 
## install cuda driver error 
```
root@app-5bbdbb7c4c-mjlb5:~# dpkg -i /root/cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
Selecting previously unselected package cuda-repo-ubuntu2204-12-3-local.
(Reading database ... 64306 files and directories currently installed.)
Preparing to unpack .../cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb ...
Unpacking cuda-repo-ubuntu2204-12-3-local (12.3.1-545.23.08-1) ...
dpkg-deb: error: <decompress> subprocess was killed by signal (Killed)
dpkg: error processing archive /root/cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb (--install):
 cannot copy extracted data for './var/cuda-repo-ubuntu2204-12-3-local/nsight-systems-2023.3.3_2023.3.3.42-1_amd64.deb' to '/var/cuda-repo-ubuntu2204-12-3-local/nsight-systems-2023.3.3_2023.3.3.42-1_amd64.deb.dpkg-new': unexpected end of file or stream
Errors were encountered while processing:
 /root/cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
```

## 7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com
### Events
```
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[app]: [Normal] [Scheduled] [Pod] Successfully assigned ce71c92h8o6sub1mptquqa7tqj5pr31oujjq0u8u0ecea/app-688d54569f-jp2tj to node4
[app]: [Normal] [Pulling] [Pod] Pulling image "gojo89/compute-27-akash:0.1-dev"
[app]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: app-688d54569f-jp2tj
[app]: [Normal] [ScalingReplicaSet] [Deployment] Scaled up replica set app-688d54569f to 1
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[7na587vv1187f6lpqrkpv39i9c.ingress.akashprovid.com]: [Normal] [Sync] [Ingress] Scheduled for sync
```

## hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com
### Events
```
[app]: [Normal] [Scheduled] [Pod] Successfully assigned uu22l1gonm8ik7ffp6kgmni8bjg027tgn3uago2d9vi88/app-766558bd75-rbl9w to node6
[app]: [Normal] [Pulled] [Pod] Container image "ubuntu:latest" already present on machine
[app]: [Normal] [Created] [Pod] Created container app
[app]: [Normal] [Started] [Pod] Started container app
[app]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: app-766558bd75-rbl9w
[app]: [Normal] [ScalingReplicaSet] [Deployment] Scaled up replica set app-766558bd75 to 1
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[hgffmafleldl5ap68ej8mi0g8k.ingress.pcgameservers.com]: [Normal] [Sync] [Ingress] Scheduled for sync
```