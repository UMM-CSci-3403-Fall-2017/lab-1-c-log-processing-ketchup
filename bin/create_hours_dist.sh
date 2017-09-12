#!/bin/bash

find $1 -type f | cat `grep "failed_login_data.txt"` | awk '{print $3;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > failed.txt

./bin/wrap_contents.sh failed.txt ./html_components/hours_dist $1/hours_dist.html

rm failed.txt
