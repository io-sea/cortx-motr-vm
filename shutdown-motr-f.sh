#!/bin/bash 
set -x

sudo pkill -9 m0d
sudo pkill -9 hax
sudo pkill -9 consul
sudo hctl shutdown
echo Done

