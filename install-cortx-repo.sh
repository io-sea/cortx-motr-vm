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
set -eu -o pipefail

#version
version=${1:-2.0.0-606}
echo "version: $version"
#github token
ghtoken=${2:-}
echo "ghtoken: $ghtoken"
echo "setting up $version..."


#local repo setup
cd ~
curl -L https://github.com/shailesh-vaidya/cortx-motr/releases/download/"$version"/set-local-repo.sh -o set-local-repo.sh
chmod a+x set-local-repo.sh
export GITHUB_TOKEN="$ghtoken"
echo "<$GITHUB_TOKEN>"
sudo -E ./set-local-repo.sh shailesh-vaidya/cortx-motr "$version"
ls /etc/yum.repos.d/ /var/tmp/
cd -
echo "done"
