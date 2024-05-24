# Akash Deploy 1.0

## Prepare

[Console-1](#Console-1)
[Console-2](#Console-2)

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

### Run localhost

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
