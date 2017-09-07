#!/bin/bash

cat `grep -rl "Failed password for" $1` > temp.txt

grep -r "Failed password for" temp.txt > temp2.txt

awk '{print $1,$2,substr($3,0,2),$(NF-5),$(NF-3);}' temp2.txt > $1/failed_login_data.txt

rm temp.txt
rm temp2.txt

