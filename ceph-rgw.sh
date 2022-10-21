#
# Copyright (c) 2022 Seagate Technology LLC and/or its Affiliates
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# For any questions about this software or licensing,
# please email opensource@seagate.com or cortx-questions@seagate.com.
#

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
