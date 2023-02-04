#! /usr/bin/bash

#Getting all the line numbers starting with an opening tag and storing them in start.txt file
grep -n "^{" exec-web.2023-02-03-03.log > start.txt

#replacing :{ in start.txt file with space
sed -i "s/:{/ /g" start.txt

#taking timestamps from user as input to get logs in between them
#reading starting timestamp 
read -p "Enter the starting timestamp range for fetching logs in the format of  YYYY-MM-DDTHH:MM:SS.msmsms" from

#reading ending timestamp
read -p "Enter the ending timestamp range for fetching logs in the format of YYYY-MM-DDTHH:MM:SS.msmsms" to

# initializing an array with elements from start.txt file
arr=( $( cat "start.txt" )) 

#creating a file to store a log
touch temp.txt
#creating a file to store logs between two timestamps
touch result.txt

#initializing a variable to check if staring tag is present in the log file
flag=0

#initializing a for loop to traverse through log file
for(( i=0; i< ${#arr[@]}; i++ ))
do
b=`expr  ${arr[$i+1]} - 1 `  

#getting lines between two opening tags and storing them in temp.txt
sed -n  "${arr[$i]},$b p" exec-web.2023-02-03-03.log > temp.txt
if grep -q "$from" temp.txt 
then
flag=1

#append logs to result.txt until ending timestamp is found
until grep -q "$to" temp.txt 
  do
  cat temp.txt
   cat temp.txt >> result.txt
  i=`expr $i + 1 `
b=`expr  ${arr[$i+1]} - 1 `  
sed -n  "${arr[$i]},$b p" exec-web.2023-02-03-03.log > temp.txt
done
cat temp.txt
  cat temp.txt >> result.txt
  exit
fi
done  
#checking whether logs are present within given timestamps in the log file
if [ $flag == 1 ]
then
echo "No logs found"
fi     
                                           