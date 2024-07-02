# Use a Linux base image
#FROM ubuntu:latest as base
FROM nvidia/cuda:12.0.0-devel-ubuntu22.04 as base-gpu

# Set the working directory to /app
WORKDIR /app

ARG SSH_PUBKEY0
ARG SSH_PUBKEY1

# Install dependencies
RUN apt update
RUN apt upgrade -y
RUN apt update && \
    apt install -y build-essential git python3 python3-pip vim curl telnet psmisc

# RUN --mount=type=cache,target=/var/cache/apt \
#   apt update && apt install git

# Python
RUN apt install -y python3-venv
RUN python3 -m venv ~/bt
RUN echo ". ~/bt/bin/activate" >> ~/.bashrc

# Configure SSH
RUN apt install -y openssh-server
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
RUN echo "$SSH_PUBKEY0" > /root/.ssh/authorized_keys
RUN echo "$SSH_PUBKEY1" >> /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

FROM base-gpu as compute-subnet-base

# Install deps

# 1. Install hashcat
RUN apt install -y hashcat

# 2. Inststall requirements.txt and requirements-compute.txt
COPY compute-subnet/requirements* /app

RUN --mount=type=cache,target=/root/.cache . ~/bt/bin/activate && pip install colorama
RUN --mount=type=cache,target=/root/.cache . ~/bt/bin/activate && cd /app && pip install -r requirements.txt
RUN --mount=type=cache,target=/root/.cache . ~/bt/bin/activate && cd /app && pip install --no-deps -r requirements-compute.txt

RUN --mount=type=cache,target=/root/.cache . ~/bt/bin/activate && pip install --upgrade bittensor

# Setup compute-subnet

# 1. Clone sources

#RUN git clone https://github.com/neuralinternet/compute-subnet && \
#  cd compute-subnet && \
#  python3 -m pip install -r requirements.txt --break-system-packages

#RUN git clone https://github.com/xen1024/compute-subnet && \
#  cd compute-subnet && \
#  git checkout dev


FROM compute-subnet-base as compute-subnet

COPY compute-subnet /app

#RUN . ~/bt/bin/activate && cd /app && pip install -e .

# 3. Bittensor

# Setup wallet
RUN mkdir -p /root/.bittensor/wallets

# Bittensor startup script 
COPY y-scripts/startup.sh /app/startup.sh
COPY y-scripts/run0.sh /root/

# Start Bittensor neuron
#CMD ["./startup.sh", ""]

WORKDIR /root

FROM compute-subnet as debug

RUN apt install -y net-tools

RUN apt install -y npm  
RUN npm install -g https://github.com/d08ble/livecomment
RUN npm install -g frontail

COPY y-scripts/start-debug.sh /root
RUN chmod +x /root/start-debug.sh
COPY y-scripts/neuron-stats.sh /root
RUN chmod +x /root/neuron-stats.sh
COPY y-scripts/bittensor-stats.sh /root
RUN chmod +x /root/bittensor-stats.sh

COPY y-scripts/llog /app/

WORKDIR /root

CMD ["sh", "./start-debug.sh"]

EXPOSE 3070
EXPOSE 8980
EXPOSE 8400
EXPOSE 8401
