sudo apt-add-repository -y "deb http://download.webmin.com/download/repository sarge contrib"
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
sudo apt update
sudo apt -y install apt-transport-https
sudo apt -y install webmin
