#!/bin/bash

cd $1

cat * > temp.txt

awk '{print $1,$2,substr($3,0,2),$(NF-5), $(NF-3);}' temp.txt > failed_login_data.txt



