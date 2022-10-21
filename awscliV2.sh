#!/bin/bash 
set -xeo

pushd ./
cd ~
pwd
echo "Installing awscli version 2!"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo yum install -y unzip
unzip awscliv2.zip
sudo ./aws/install
sudo pip3 install awscli-plugin-endpoint
export PATH=/usr/local/bin:$PATH 
aws --version
#aws configure
popd
 
