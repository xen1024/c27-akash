# Import config
. ~/.config-akash

echo Configuring ssh key
mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa $SSH_PUBKEY root" > /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd
