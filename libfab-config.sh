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
