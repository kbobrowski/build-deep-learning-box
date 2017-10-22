# upgrade
sudo apt update
sudo apt -y upgrade

# add ppa
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt update

# install driver without recommends
sudo apt -y install --no-install-recommends nvidia-384

# install required additional packages
sudo apt -y install nvidia-modprobe libcuda1-384

sudo reboot now
