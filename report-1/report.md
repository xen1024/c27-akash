# Akash testing report

# trying install cuda drivers

Method 1:

https://ubuntu.com/server/docs/nvidia-drivers-installation

Method 2:

install cuda-repo-ubuntu2204-12-3-local.deb

## Akash Issues
Akash Issues
- No GPU providers with persistent storage

## Akash Providers
Providers:
- provider.medc1.com (rtx4090, A100)
- pcgameservers.com (rtx4090)
- akash.pub (rtx4090)
- provider.akashprovid.com (rtx3090)


### a40
No A40 on Akash (?)

### provider.medc1.com
Provider: provider.medc1.com
#### rtx4090
92644sthu1flfeos20n6ajq8uc.ingress.medc1.com
  - wrong docker container? no cuda-drivers.deb and pre. Maybe old?
  - just rebooted after some time, all downloads is lost
  - reboot after dpkg error
#### A100
d7uov4ibblfdff9kc7m2aq0lus.ingress.medc1.com
  - rebooted
  - Tried to unpack deb on Akash with A100 - fail
  - Tried to unpack deb while Docker build - success
  - Tried to install unpacked drivers - crash VM
  - Method from Discord does not work: ubuntu-drivers is halt 
6tlf89u09hehtc7f64o91847d0.ingress.medc1.com
  - A100 with ubuntu:latest
  - A100 with akash-docker
  - Akash halt after reboot
  - Halted, not listed on Akash bids after close VM 

##### d7uov4ibblfdff9kc7m2aq0lus.ingress.medc1.com
d7uov4ibblfdff9kc7m2aq0lus.ingress.medc1.com A100
```
$ dpkg -i *.deb
..
Preparing to unpack cuda_12.3.1-1_amd64.deb ...
Unpacking cuda (12.3.1-1) ...
Preparing to unpack gds-tools-12-3_1.8.1.2-1_amd64.deb ...
make: Entering directory '/usr/local/cuda-12.3/gds/samples'
find . -type f -executable -delete
rm -f *.o cufile.log
make: Leaving directory '/usr/local/cuda-12.3/gds/samples'
Unpacking gds-tools-12-3 (1.8.1.2-1) over (1.8.1.2-1) ...
Preparing to unpack libcublas-12-3_12.3.4.1-1_amd64.deb ...
Unpacking libcublas-12-3 (12.3.4.1-1) over (12.3.4.1-1) ...
dpkg-deb: error: <decompress> subprocess was killed by signal (Killed)
dpkg: error processing archive libcublas-12-3_12.3.4.1-1_amd64.deb (--install):
 cannot copy extracted data for './usr/local/cuda-12.3/targets/x86_64-linux/lib/libcublas.so.12.3.4.1' to '/usr/local/cuda-12.3/targets/x86_64-linux/lib/libcublas.so.12.3.4.1.dpkg-new': unexpected end of file or stream
Preparing to unpack libcublas-dev-12-3_12.3.4.1-1_amd64.deb ...
Unpacking libcublas-dev-12-3 (12.3.4.1-1) over (12.3.4.1-1) ...
dpkg-deb: error: <decompress> subprocess was killed by signal (Killed)
dpkg: error processing archive libcublas-dev-12-3_12.3.4.1-1_amd64.deb (--install):
 cannot copy extracted data for './usr/local/cuda-12.3/targets/x86_64-linux/lib/libcublasLt_static.a' to '/usr/local/cuda-12.3/targets/x86_64-linux/lib/libcublasLt_static.a.dpkg-new': unexpected end of file or stream
Preparing to unpack libcufft-12-3_11.0.12.1-1_amd64.deb ...
Unpacking libcufft-12-3 (11.0.12.1-1) over (11.0.12.1-1) ...
Connection to d7uov4ibblfdff9kc7m2aq0lus.ingress.medc1.com closed by remote host.
Connection to d7uov4ibblfdff9kc7m2aq0lus.ingress.medc1.com closed.
```

##### 6tlf89u09hehtc7f64o91847d0.ingress.medc1.com
6tlf89u09hehtc7f64o91847d0.ingress.medc1.com A100
```
[app]: [Normal] [Pulled] [Pod] Container image "gojo89/compute-27-akash:0.1-dev" already present on machine
[app]: [Normal] [Created] [Pod] Created container app
[app]: [Normal] [Started] [Pod] Started container app
[app]: [Warning] [Evicted] [Pod] Pod ephemeral local storage usage exceeds the total limit of containers 1073741824. 
[app]: [Normal] [Killing] [Pod] Stopping container app
[app]: [Warning] [ExceededGracePeriod] [Pod] Container runtime did not kill the pod within specified grace period.
[app]: [Normal] [Scheduled] [Pod] Successfully assigned tjlgv8u2og21u569aijhlr7fht7ikcbbgnsbpp20uk5q4/app-68b547767f-qnjhw to node4
[app]: [Normal] [Pulled] [Pod] Container image "gojo89/compute-27-akash:0.1-dev" already present on machine
[app]: [Normal] [Created] [Pod] Created container app
[app]: [Normal] [Started] [Pod] Started container app
[app]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: app-68b547767f-qnjhw
```

##### t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com
t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com A100
```
[app]: [Normal] [Scheduled] [Pod] Successfully assigned 92hff66l2hb5pcnhq1fcebsu1e9v34hepe1dck1d8n9de/app-589b99f4f9-fdzm9 to node4
[app]: [Normal] [Pulling] [Pod] Pulling image "gojo89/compute-27-akash:0.1-dev"
[app]: [Normal] [Pulled] [Pod] Successfully pulled image "gojo89/compute-27-akash:0.1-dev" in 5m39.656426833s (5m39.656443628s including waiting)
[app]: [Normal] [Created] [Pod] Created container app
[app]: [Normal] [Started] [Pod] Started container app
[app]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: app-589b99f4f9-fdzm9
[app]: [Normal] [ScalingReplicaSet] [Deployment] Scaled up replica set app-589b99f4f9 to 1
[t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[t63mm7a5l9fbn1o6m6hd19ank4.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
```

##### bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com
bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com A100 with ubuntu:latest
```
[app]: [Normal] [Scheduled] [Pod] Successfully assigned pvunk2k2bkhd892t7q4iqs7r0ni4e7e3fvvp1m5kmtmfg/app-6c49fb445d-bmmdf to node4
[app]: [Normal] [Pulled] [Pod] Container image "ubuntu:latest" already present on machine
[app]: [Normal] [Created] [Pod] Created container app
[app]: [Normal] [Started] [Pod] Started container app
[app]: [Normal] [SuccessfulCreate] [ReplicaSet] Created pod: app-6c49fb445d-bmmdf
[app]: [Normal] [ScalingReplicaSet] [Deployment] Scaled up replica set app-6c49fb445d to 1
[bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
[bsiph0jilddtj6f42a5vuejo4s.ingress.medc1.com]: [Normal] [Sync] [Ingress] Scheduled for sync
```

### rtx4090
Provider: pcgameservers.com 
  - issue with reboot while install nvidia driver (asked on Akash discord)
    apt-get -y install -y cuda-drivers
  - docker CMD not work
u63658qf4la4d58t8ue0654es0.ingress.pdx.nb.akash.pub
  - can''t start docker container

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

# Links

## SDL
https://akash.network/docs/getting-started/stack-definition-language/#servicesexposeto

