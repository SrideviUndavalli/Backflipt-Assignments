#! /usr/bin/bash
#read and check if a dir exits or create it
#read directory name
 read -p "Enter directory name" dir
 if [ -d "$dir" ]
 then
   echo " $dir directory exists"
 else
   mkdir $dir cd ..
 fi