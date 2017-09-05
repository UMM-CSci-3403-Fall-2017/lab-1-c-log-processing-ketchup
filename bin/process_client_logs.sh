#!/bin/bash

dir=$1
cd ../$1

cat * > temp.txt

awk '{print $1,$2,`grep [^:]* $3`,$(NF-3), $(NF-5);}' temp.txt > failed_login_data.txt



