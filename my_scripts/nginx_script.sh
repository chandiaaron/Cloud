#!/bin/bash

# update packages 
sudo apt update -y

# upgrade packages 
sudo apt upgrade -y

# Install nginx
sudo apt install nginx -y

# Restart nginx
sudo systemctl restart nginx

# Enable nginx
sudo systemctl enable nginx
