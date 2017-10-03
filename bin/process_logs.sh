#!/bin/bash

SCRATCH=`mktemp -d`
home=$(pwd)

#Here we use a loop to go through all of the command arguments and first taking the name of the file,
#then we create a directory with that name of the file, and that we tar the contents of command argument 
#to the appropiate directory that we created. Then we use the process_client_logs script on the new directory
for arg in "$@"
do 
	tempname=$(basename $arg)
	name=$(echo $tempname | cut -f 1 -d '_')
	mkdir $SCRATCH/$name
	tar -zxf $home/$arg -C $SCRATCH/$name
	./bin/process_client_logs.sh $SCRATCH/$name

done

#Using the scripts we made on the SCRATCH directory
./bin/create_username_dist.sh $SCRATCH/

./bin/create_hours_dist.sh $SCRATCH/

./bin/create_country_dist.sh $SCRATCH/

./bin/assemble_report.sh $SCRATCH/

#Moving the file we created in the SCRATH directory to the appropiate place
mv $SCRATCH/failed_login_summary.html $home

#removing the SCRATCH directory
rm -rf $SCRATCH
