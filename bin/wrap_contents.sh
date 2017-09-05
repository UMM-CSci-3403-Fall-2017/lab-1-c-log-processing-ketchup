#!/bin/bash

content=$1
header=$2\_header.html
footer=$2\_footer.html
result=$3

cat $header $content $footer > $result 
