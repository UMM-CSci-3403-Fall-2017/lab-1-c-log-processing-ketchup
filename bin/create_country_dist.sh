#1/bin/bash

#finding the correct columns that we need
find $1 -type f | cat `grep "failed_login_data.txt"` | awk '{print $5;}' | sort > failed_login.txt

#Joining the columns with the correct syntax that we want
join -j1 ./etc/country_IP_map.txt failed_login.txt | awk '{print $2;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt

#removing the temp file we created
rm failed_login.txt

#using our wrap_contents to wrap the contents
./bin/wrap_contents.sh failed.txt ./html_components/country_dist $1/country_dist.html

#removing the temp file we created
rm failed.txt

