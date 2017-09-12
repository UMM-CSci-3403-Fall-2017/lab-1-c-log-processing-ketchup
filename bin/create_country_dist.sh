#1/bin/bash

find $1 -type f | cat `grep "failed_login_data.txt"` | awk '{print $5;}' | sort > failed_login.txt

join -j1 ./etc/country_IP_map.txt failed_login.txt | awk '{print $2;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt

rm failed_login.txt

./bin/wrap_contents.sh failed.txt ./html_components/country_dist $1/country_dist.html

rm failed.txt

