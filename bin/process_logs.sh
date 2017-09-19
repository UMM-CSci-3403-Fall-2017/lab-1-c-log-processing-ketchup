#!/bin/bash

SCRATCH=`mktemp -d`
home=$(pwd)
cd $SCRATCH

for arg in "$@"
do 
	tempname=$(basename $arg)
	name=$(echo $tempname | cut -f 1 -d '_')
	mkdir $name
	tar -zxf $home/$arg -C $name

done


