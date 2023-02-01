#! /usr/bin/bash
#read directory from user and remove if it is present else print not exists
read -p "Enter directory name" directoryName
if [ -d "$directoryName" ]
then 
rm -rf $directoryName
else
echo " $directoryName does not exist"
fi