#!/bin/bash

#cd $1

#cat * > temp.txt

grep -R "Failed password for" $1 > temp1.txt

#rm temp.txt

awk '{print $1,$2,substr($3,0,2),$(NF-5),$(NF-3);}' temp1.txt > failed_login_data.txt

rm temp1.txt
