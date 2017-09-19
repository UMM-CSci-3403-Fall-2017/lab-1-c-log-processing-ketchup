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

./bin/create_username_dist.sh $SCRATCH/

./bin/create_hours_dist.sh $SCRATCH/

./bin/create_country_dist.sh $SCRATCH/

./bin/assemble_report.sh $SCRATCH/

mv $SCRATCH/failed_login_summary.html $home

rm -rf $SCRATCH
