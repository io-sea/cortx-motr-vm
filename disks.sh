#!/bin/bash 
dest="$HOME/var/motr"
mkdir -p "$dest" 
for i in {0..9}; do 
	dd if=/dev/zero of="$dest/disk$i.img" bs=1M seek=9999 count=1 
done