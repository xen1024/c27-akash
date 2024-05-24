# Use a Linux base image
FROM ubuntu:latest as base

# Set the working directory to /app
WORKDIR /app

ARG SSH_PUBKEY0

# Install dependencies
RUN apt update && \
    apt install -y build-essential git python3 python3-pip vim

# Configure SSH
RUN apt install -y openssh-server
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
RUN echo "$SSH_PUBKEY0" > /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

FROM base as compute-subnet

# Setup compute-subnet

# 1. Clone sources

#RUN git clone https://github.com/neuralinternet/compute-subnet && \
#  cd compute-subnet && \
#  python3 -m pip install -r requirements.txt --break-system-packages

COPY compute-subnet /app

# 2. Install deps

RUN apt install -y hashcat

RUN pip install colorama --break-system-packages
RUN cd /app && \
  python3 -m pip install -r requirements.txt --break-system-packages

# 3. Bittensor

# Setup wallet
RUN mkdir -p /root/.bittensor/wallets/default
#COPY wallet/default /root/.bittensor/wallets/default

# Bittensor startup script 
COPY startup.sh /app/startup.sh

# Start Bittensor neuron
#CMD ["./startup.sh", ""]
