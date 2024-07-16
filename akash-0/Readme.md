# Akash Deploy 1.0

## Documentation

### Files

```
1-cleanup                 # files for cleanup
Dockerfile                # Dockerfile for creating image
Readme.md                 # Readme
akash-push.sh             # Akash script to create VM with provider-services cli (draft)
compute-subnet            # Compute-subnet source code. Install without git (required, for development)

# Config files
config-akash              # Config file (required)
config-debug              # Debug configuration (optional, required for debug)

# Configuration generators
configure.sh              # Generate config-akash
create-akash-yaml.sh      # Generate deploy yaml files from template

# Common
lib.sh                    # Common library

# Docker Build and push
docker-build.sh           # Docker build container
docker-push.sh            # Docker push container
docker-new-version.sh     # Generate new docker version for each build (experimental)
docker-run.sh             # Docker run localhost
start-local.sh            # Docker run helper. Run, install wallet and configuration

# Docker Deploy
deploy-files.sh           # Deploy files
init-docker.sh            # Init docker
update-debug-ports.sh     # Update debug ports
deploy-wallet.sh          # Deploy wallet

# Templates
deploy-template-0.yaml    # Akash GPU template
deploy-endpoint-0.yaml    # Endpoint-0 template
deploy-endpoint-1.yaml    # Endpoint-1 template

# Generated Akash yaml
deploy.yaml               # Primary GPU VM
deploy-ep-1.yaml          # Endpoint-1 VM
deploy-gpu-2.yaml         # Common GPU VM without configuration

# Utils
ssh-login.sh              # SSH login helper

# Deploy files
y-scripts/**              # Scripts
post-install.sh
llog/Akash-links.sh
llog/Akash-plugins
llog/Akash-plugins/plugins.js
llog/gen-links.sh
post-install2.sh
bittensor-stats.sh
start-debug.sh
install0.sh
tunnel-ports.sh
startup.sh
neuron-stats.sh
run0.sh
```

#### Configuration scripts



## Startup

### Create configuration
Run
```
./configure.sh
```
Set `config-akash` root SSH key for SSH access (need to init docker)
```
export SSH_PUBKEY=AAAAB3Nz...
```
Modify other params

### Run localhost Method-1

1. Add your Docker ssh key with ssh-agent
```
ssh-add ~/.ssh/id_rsa
```
2. Start docker with local
```
./start-local.sh
```
Console log:
```
$ ./start-local.sh
...
...
Docker container ready!
=============================
Time: 277 seconds
=============================
Akash Docker container ready!
=============================
```
### Troubleshoting

#### Error: Could not open a connection to your authentication agent
Ubuntu console on Windows
```
eval `ssh-agent -s`
```



### Run localhost Method-2

#### Prepare

[Console-1](#Console-1)
[Console-2](#Console-2)

#### Console-1

Build docker
```
./docker-build
```
Run docker locally
``` 
./docker-run
```

#### Console-2

1. Add your Docker ssh key with ssh-agent
```
ssh-add ~/.ssh/id_rsa
```

2. Run script for your docker ssh ip:port
Init localhost
```
./deploy-files.sh wallet_dir localhost
```

3. Try SSH if needed 
```
ssh root@localhost -o StrictHostKeyChecking=no
```

### Deploy to Akash

#### Build and deploy docker container to Dockerhub

Login to Dockerhub
```
docker login
```
Push container
```
docker push username/compute-27-akash:0.1-dev
```

#### Create new VM on Akash 

Create Akash configuration deploy.yaml
```
./create-akash-yaml.sh
```
Deploy options:
- Manually deploy with Akash Cosmos UI
- Manually deploy with Akash CLI provider-services
- Automaticly deploy with akash-push.sh

Use akash-push.sh script to deploy (TODO)
```
# ./akash-push.sh ...
```
Init Akash
```
./deploy-files.sh wallet_dir akash_url
```
