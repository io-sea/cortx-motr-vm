#!/bin/bash 
set -x

#Kill rgw
#Start/restart motr
#sudo pkill -9 radosgw
sudo hctl shutdown
./disks.sh
sudo hctl bootstrap --mkfs ./singlenode.yaml
hctl status

#Create ceph config file
conf_file=/etc/ceph/ceph.conf
sudo mkdir -p $(dirname $conf_file)
sudo bash -c "./motraddr.sh --ceph-conf > /etc/ceph/ceph.conf"
cat /etc/ceph/ceph.conf

#Create radosgw admin
#Make sure the accesskey/secretkey pair matches AWS Cli configuration
radosgw-admin user create --uid rgwuser1 --display-name rgwuser1 --access-key ahsdfewdgluawxxxxaasd --secret jkaowxe345nfdakn7bqqs6 --no-mon-config
 
#Start radosgw service
#Use sudo pkill -9 radosgw to stop the service
sudo /usr/bin/radosgw -f --name client.rgw --no-mon-config &
 
#AWS s3 commands
#Execute s3 commands, preferably in another console
./s3aws.sh
