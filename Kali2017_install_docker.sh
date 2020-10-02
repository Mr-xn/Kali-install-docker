#!/bin/bash

#=================================================
#   Description: Install docker for Kali
#   Version: 0.0.1
#   Author: Mrxn
#   Blog: https://mrxn.net/Linux/install_docker_script_for_Kali.html
#   PS: 欢迎大家到github提建议和bug
#=================================================

#!/bin/bash

# update apt-get
sudo apt-get update

# remove previously installed Docker
sudo apt-get purge lxc-docker*
sudo apt-get purge docker.io*

sudo apt-get update

# install Docker
sudo apt install -y docker.io
sudo systemctl enable docker --now


# configure Docker user group permissions
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

# run Hellow World image
sudo docker run hello-world

# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# configure Docker to start on boot
sudo systemctl enable docker
