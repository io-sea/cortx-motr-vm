#!/bin/bash 

file=~/.aws/config 
mkdir -p $(dirname $file)
echo "[default]" > $file
echo "region = us-east-1" >> $file
echo "output = text" >> $file

file=~/.aws/credentials 
mkdir -p $(dirname $file)
echo "[default]" > $file
echo "aws_access_key_id = ahsdfewdgluawxxxxaasd" >> $file
echo "aws_secret_access_key = jkaowxe345nfdakn7bqqs6" >> $file

(set -x; cat ~/.aws/config)
(set -x; cat ~/.aws/credentials)
echo "done!"
