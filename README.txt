
################################################################################
CORTX-MOTR CLUSTER
Installation instructions
################################################################################

# Setup local Cortx rpm repo.
 ./install-cortx-repo.sh 2.0.0-6068

# Install Cortx rpms
sudo yum install -y cortx-hare
sudo yum install -y cortx-motr cortx-motr-devel
sudo yum install -y ceph-radosgw

# libfabric 
# You need to configure libfabric by providing network protocol(like tcp/ib) and 
# interface(like eth0/enp0s3, as on your system) to be used. Please use the 
# script libfab-config.sh and supply network "protocol and interface" as arguments
# to do the same.  
# Use the ifconfig or ip commands to display all available network interfaces on
# your system.

example:
====================================== 
>> sudo sh libfab-config.sh tcp enp0s3
>> cat /etc/libfab.conf
networks=tcp(enp0s3)
======================================

# Disks
# Use the script disks.sh from scripts folder to create storage for Motr.
# By default disks are created at $HOME/var/motr.
# Modify the dest variable to choose a different location.
>> ./disks.sh

# The singlenode.yaml file contains a 1node cluster description. 
# Download/copy it to your home directory.
# Replace all instances of /home/seagate/var/motr in the CDF with 
# matching dest variable value(normally $HOME) from above.
# Replace eth0/enp0s3 with your network interface name same as 
# libfabric is configured with using libfab-config.sh.

# hctl
# Use hctl commands to operate the cluster
>> sudo hctl bootstrap --mkfs ~/singlenode.yaml 
>> hctl status
>> sudo hctl shutdown
>> sudo hctl start

Note:
hctl shutdown command will take a long time to shutdown the cluster.

################################################################################
S3 INTERFACE
Please make sure that the above steps are working fine without any issues before
moving to install the S3 interface. A fully working instance of a singlenode 
Motr cluster is a prerequisite for the successful installation of the S3
interface.
################################################################################

# Install AWS Cli v2.
./awscliV2.sh

# Configure AWS Cli v2 
# Make sure the accesskey/secretkey pair matches radosgw admin user
./awscliV2-config.sh

# Setup the S3 interface
# Make sure the accesskey/secretkey pair matches awscli v2 user setup
./ceph-rgw.sh

# AWS s3 commands
# Execute s3 commands, preferably in another console
./s3aws.sh
 