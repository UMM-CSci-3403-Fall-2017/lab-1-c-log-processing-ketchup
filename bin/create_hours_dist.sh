#!/bin/bash

find $1 -type f | cat `grep "failed_login_data.txt"` | awk '{print $3;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt
#We First iterate through all the subdirectories and directories under the directory that is given in the form of command line argument and search for all file names with the name of "Failed_login_data.txt". 
#Then, we conconate all those files together and collect the third column, which is the user name of the attempted login. We sort them by name and then the uniq -c is used to calculate the count of each name
#occurrence. The second awk statement actually put the attempted login username and its count in a format that Javascript could be used to create the chart. The end result is put into the the failed.txt.

./bin/wrap_contents.sh failed.txt ./html_components/hours_dist $1/hours_dist.html
#the wrap_contents.sh is used to wrap the header and the footer around the failed.txt. Wrap_contents.sh takes in three argument and work the same as pre-lab-1, the result file is saved as hours_dist.html

rm failed.txt
# to remove the temporary failed.txt
