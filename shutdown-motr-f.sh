#!/bin/bash 
set -x

sudo pkill -9 m0d
sudo pkill -9 hax
sudo pkill -9 consul
sudo hctl shutdown
sudo du -hcs /var/motr/ /var/log/motr/ /var/log/seagate/ 2> /dev/null
sudo rm -rf /var/motr/
sudo du -hcs /var/motr/ /var/log/motr/ /var/log/seagate/ 2> /dev/null
echo Done

