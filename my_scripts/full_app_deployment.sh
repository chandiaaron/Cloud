#!/bin/bash

# update packages
sudo apt update -y 

echo step 1 Done!

# upgrade packages 
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# clone repo with app code
git clone https://github.com/chandiaaron/nodejs20-sparta-test-app-2025.git

# install ngnix 
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# get the required version of nodejs
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"

# install nodejs20
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# cd into repo dir
cd nodejs2-sparta-test-app-2025

# change dir
cd app

# npm install to set up app
sudo npm install 

# app start
# sudo npm start 
# install pm2 - process manager package for nodejs apps
sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g 

# kill any running node processes that could interfere
pm2 kill

# run the app with pm2
pm2 start app.js 