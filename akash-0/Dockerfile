# Use a Linux base image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

ARG SSH_PUBKEY

# Install dependencies
RUN apt update && \
    apt install -y build-essential git python3 python3-pip

# Configure SSH
RUN apt install -y openssh-server
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
#RUN echo "$SSH_PUBKEY" > /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

# Setup compute-subnet

RUN pip install colorama --break-system-packages

#RUN git clone https://github.com/neuralinternet/compute-subnet && \
#  cd compute-subnet && \
#  python3 -m pip install -r requirements.txt --break-system-packages

COPY compute-subnet /app
RUN cd /app && \
  python3 -m pip install -r requirements.txt --break-system-packages


