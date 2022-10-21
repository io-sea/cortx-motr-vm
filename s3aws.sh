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
