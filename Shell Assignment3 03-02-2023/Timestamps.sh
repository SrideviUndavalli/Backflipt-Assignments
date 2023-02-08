#! /usr/bin/bash

#Getting all the line numbers starting with an opening tag and storing them in start.txt file
grep -n "^{" exec-web.2023-02-03-03.log > start.txt

#replacing :{ in start.txt file with space
sed -i "s/:{/ /g" start.txt

#taking timestamps from user as input to get logs in between them
#reading starting timestamp 
read -p "Enter the starting timestamp range for fetching logs in the format of  YYYYMMDDHHMMSSmsmsms" from

#reading ending timestamp
read -p "Enter the ending timestamp range for fetching logs in the format of YYYYMMDDHHMMSSmsmsms" to

# initializing an array with elements from start.txt file
arr=( $( cat "start.txt" )) 

#creating a file to store logs in between  the two timestamps
touch result.txt

#initializing a variable to check if logs are present between the given timestamps
flag=0

#initializing a for loop to traverse through log file
for(( i=0; i< ${#arr[@]}; i++ ))
do
b=`expr  ${arr[$i+1]} - 1 ` 

#extracting lines having string ="timestamp" in a block using sed and grep command
# extracting timestamp as an integer by removing necessary characters from it
a=$(sed -n  "${arr[$i]},$b p" exec-web.2023-02-03-03.log | grep  "timestamp:" | cut -c 15- | rev | cut -c4- | rev | tr -d : | tr -d - |tr -d . |tr -d T )

# checking if our timestamp is present in between the given two timestamps
 if [ $a -ge $from ] && [ $a -le $to ] 
 then 
 flag=1;

 #if true then append the log to the result.txt

 sed -n  "${arr[$i]},$b p" exec-web.2023-02-03-03.log >> result.txt 
 fi
done  
if [ flag ==0 ] 
then
echo "no logs present between the given timestamps"
fi
cat result.txt
                                           