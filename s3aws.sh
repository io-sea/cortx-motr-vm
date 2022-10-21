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

cd ~
set -x
aws s3 mb s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 ls --endpoint-url http://127.0.0.1:8000
touch foo.txt
aws s3 cp foo.txt s3://test-bucket/object1 --endpoint-url http://127.0.0.1:8000
aws s3 ls s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 rb s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 ls --endpoint-url http://127.0.0.1:8000
aws s3 rm s3://test-bucket/object1 --endpoint-url http://127.0.0.1:8000
aws s3 rb s3://test-bucket --endpoint-url http://127.0.0.1:8000

#cp
dd if=/dev/urandom of="input" bs=8M count=16
ls -lh input
aws s3 mb s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 cp input s3://test-bucket/input --endpoint-url http://127.0.0.1:8000
aws s3 cp s3://test-bucket/input output --endpoint-url http://127.0.0.1:8000
cmp input output || echo "ERROR: Test Failed !!"
aws s3 rm s3://test-bucket/input --endpoint-url http://127.0.0.1:8000
aws s3 rb s3://test-bucket --endpoint-url http://127.0.0.1:8000
set +x

#mv
dd if=/dev/urandom of="input" bs=8M count=16
ls -lh input
aws s3 mb s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 mv input s3://test-bucket/input --endpoint-url http://127.0.0.1:8000
aws s3 ls s3://test-bucket --endpoint-url http://127.0.0.1:8000
ls -lh input
aws s3 mv s3://test-bucket/input output --endpoint-url http://127.0.0.1:8000
aws s3 ls s3://test-bucket --endpoint-url http://127.0.0.1:8000
ls -lh output
aws s3 rb s3://test-bucket --endpoint-url http://127.0.0.1:8000

#sync
aws s3 mb s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 sync /etc/yum.repos.d/ s3://test-bucket/repos --endpoint-url http://127.0.0.1:8000
aws s3 ls s3://test-bucket --endpoint-url http://127.0.0.1:8000
aws s3 rb s3://test-bucket --endpoint-url http://127.0.0.1:8000 --force

rm -rf input output
cd -
echo "done!"
