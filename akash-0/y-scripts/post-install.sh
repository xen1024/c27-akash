# Import config
. ~/.config-akash

echo Configuring ssh key
mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa $SSH_PUBKEY root" > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
mkdir -p /var/run/sshd
chmod 0755 /var/run/sshd
