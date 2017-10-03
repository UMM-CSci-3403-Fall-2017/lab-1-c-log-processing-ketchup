#!/bin/bash

#Concatenating country_dist, hours_dist, username_dist into a temporary file, temp.txt
cat $1/country_dist.html $1/hours_dist.html $1/username_dist.html > temp.txt

#Using our wrap_contents to wrap the contents
./bin/wrap_contents.sh temp.txt ./html_components/summary_plots $1/failed_login_summary.html

#removing the temp text
rm temp.txt
