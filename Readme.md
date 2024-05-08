# Prepare

# Build

Build docker container for Akash

Set `SSH_PUBKEY` your SSH public key
```
docker build --build-arg SSH_PUBKEY="$SSH_PUBKEY" -t username/compute-27-akash:0.1-dev .
```

# Deploy image to DockerHub

Login to Dockerhub
```
docker login
```

Push container
```
docker push username/compute-27-akash:0.1-dev
```

# Run container locally

Run container
```
docker run -it -p 22:22 username/compute-27-akash:0.1-dev
```

Connect with SSH
```
ssh root@localhost
```
