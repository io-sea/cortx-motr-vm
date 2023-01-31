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

if [ $# -ne 2 ] 
then
	echo "=============================FAILED==================================="
	echo "No arguments supplied. Requires 2 arguments =>1. protocol 2. interface"
	echo "Example1: sudo sh libfab-config.sh tcp eth0"
	echo "Example2: sudo sh libfab-config.sh ib ib0"
	echo "==============================HELP===================================="
	exit
fi

sudo echo "networks=$1($2)" > /etc/libfab.conf
(set -x; cat /etc/libfab.conf)

