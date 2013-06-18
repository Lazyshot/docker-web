#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y redis-server curl build-essential

curl -L https://get.rvm.io | bash -s stable --rails

rvm install 1.9.3

sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

sudo npm install hipache -g

sudo hipache