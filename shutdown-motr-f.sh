#!/bin/bash 
set -x
sleep 0.5; sudo pkill -9 m0d
sleep 0.5; sudo pkill -9 m0d
sleep 0.5; sudo pkill -9 hax
sleep 0.5; sudo pkill -9 consul
sleep 0.5; sudo pkill -9 consul
sudo du -hcs /var/motr/ /var/log/motr/ /var/log/seagate/ 2> /dev/null
sudo rm -rf /var/motr/
sudo du -hcs /var/motr/ /var/log/motr/ /var/log/seagate/ 2> /dev/null
echo Done
