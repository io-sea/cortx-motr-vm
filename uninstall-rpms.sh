#!/bin/bash 
set -x
sudo hctl shutdown
sudo yum remove -y ceph-radosgw
sudo yum remove -y cortx-hare
sudo yum remove -y cortx-motr cortx-motr-devel
sudo rm -rf /var/motr /etc/motr
echo "done"
