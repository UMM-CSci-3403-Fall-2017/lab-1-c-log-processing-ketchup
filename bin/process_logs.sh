#!/bin/bash

SCRATCH=`mktemp -d`
home=$(pwd)
cd $SCRATCH

for arg in "$@"
do 
	name=$(echo $arg | cut -f 1 -d '_')
	mkdir $name
	tar -zxf $home/log_files/$arg -C $name

done


