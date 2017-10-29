#!/bin/bash

#=================================================
#   Description: Install docker for Kali
#   Version: 0.0.1
#   Author: Mrxn
#   Blog: https://mrxn.net/Linux/install_docker_script_for_Kali.html
#   PS: 欢迎大家到github提建议和bug
#=================================================


# install dependencies 
sudo apt-get install apt-transport-https ca-certificates curl gnupg software-properties-common dirmngr

# use https get sources  
sudo echo "deb https://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
sudo echo "deb-src https://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list


# update apt-get
export DEBIAN_FRONTEND="noninteractive"
sudo apt-get update

# remove previously installed Docker
sudo apt-get purge lxc-docker*
sudo apt-get purge docker.io*


# add Docker repo gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# add deb docker sources
sudo echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list 

cat > /etc/apt/sources.list.d/docker.list <<'EOF'
deb https://apt.dockerproject.org/repo debian-stretch main
EOF
sudo apt-get update

# install Docker
sudo apt-get install docker-ce

# run Hellow World image
sudo docker run hello-world

# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# configure Docker to start on boot
sudo systemctl enable docker