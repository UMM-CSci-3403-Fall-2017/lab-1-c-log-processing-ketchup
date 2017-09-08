#!/bin/bash

#Here we are useing grep to look for every file that has the pattern "Failed password for", we are looking 
#recursively through the directories and subdirectories, and if the file contains this pattern, the -l in grep 
#will show which file is this, and cat concatenates all of these files into one big file temp.txt
cat `grep -rl "Failed password for" $1` > temp.txt 

#Here we are using the grep function to look recursively through all the directories and subdirectories to get 
#all of the lines with the pattern "Failed password for", and putting these file in anothe file temp2.txt
grep -r "Failed password for" temp.txt > temp2.txt

#Now that we have a file with only the lines we care about, we will use awk to get the columns we want
#With $1 and $2 we get the month and day respectively
#With substr($3,0,2) we will get the 3rd columns which is the time, but we will use substr 
#to get only the first 2 characters, so the hour
#With $(NF-5) we will get the column that is 5 columns away from the last column, which is the login name
#With $(NF-3) we will get the column that is 3 columns away from the last column, which is the IP address
#After getting the correct column for each line from temp2.txt, we will put them in the file failed_login_data.txt
awk '{print $1,$2,substr($3,0,2),$(NF-5),$(NF-3);}' temp2.txt > $1/failed_login_data.txt

#Removing the temp files
rm temp.txt
rm temp2.txt

