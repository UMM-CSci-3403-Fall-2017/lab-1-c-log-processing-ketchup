#!/bin/bash

#finding the correct coulmns we want and adding them with the correct syntax
find $1 -type f | cat `grep "failed_login_data.txt"` | awk '{print $4;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt

#using the our wrap_contents to wrap the contents
./bin/wrap_contents.sh failed.txt ./html_components/username_dist $1/username_dist.html

#removing the temp file we created
rm failed.txt

