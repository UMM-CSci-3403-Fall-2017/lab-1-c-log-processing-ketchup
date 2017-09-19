#!/bin/bash

SCRATCH=`mktemp -d`
home=$(pwd)

for arg in "$@"
do 
	tempname=$(basename $arg)
	name=$(echo $tempname | cut -f 1 -d '_')
	mkdir $SCRATCH/$name
	tar -zxf $home/$arg -C $SCRATCH/$name
	./bin/process_client_logs.sh $SCRATCH/$name

done


