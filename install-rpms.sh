#!/bin/bash 
set -x
sudo yum install -y cortx-hare
sudo yum install -y cortx-motr cortx-motr-devel
sudo yum install -y ceph-radosgw
echo "done"
