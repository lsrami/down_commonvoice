#!/bin/bash

path=$1
name=`basename $path |cut -d '?' -f1`
wget -c $path -O $name
