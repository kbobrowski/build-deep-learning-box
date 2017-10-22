if [ $# -eq 1 ]; then
    rcfile=$1
    if [ ! -f $rcfile ]; then
        echo "rcfile not found!"
        exit
    fi
else
    echo "Pass rcfile as first argument, e.g. bash build-4-ssh.sh ~/.bashrc"
    exit
fi

# set up ssh client
ssh-keygen
sudo apt -y install keychain
echo 'alias add-key="keychain ~/.ssh/id_rsa && source ~/.keychain/$HOST-sh"' >> $rcfile
echo 'source ~/.keychain/$HOST-sh' >> $rcfile


# set up ssh server
sudo apt -y install openssh-server
sudo systemctl restart ssh


# disable root login
sudo sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo systemctl restart ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
sudo reboot now
