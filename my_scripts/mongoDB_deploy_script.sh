#!/bin/bash

# update packages 
sudo apt update -y

# upgrade packages
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Installs gnupg for package verifcation and curl for transferring data from URLs
sudo apt-get install gnupg curl

# Add the GPG key which Mongo DB packages are signed with to make sure they are authentic:
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# Allows the system to install and update MongoDB from MongoDBs official servers
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#
sudo apt update -y

# Install mongoDB
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

