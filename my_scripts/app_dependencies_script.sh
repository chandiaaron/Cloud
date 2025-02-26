#!/bin/bash

# update packages
sudo apt update -y 

# upgrade packages 
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# install ngnix 
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# get the required version of nodejs
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"

# install nodejs20
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# change dir
cd app

# npm install to set up app
sudo npm install 

# app start
sudo npm start 



