#! /usr/bin/bash
#prog to check whether the user provided values are null
read -p "Enter your name" Name
if [ -z "$Name" ]
 then exit
 else
 touch file.txt
 echo $Name > file.txt
 read -p "Enter your number " Number
 fi
 if [  -z  "$Number" ]
  then exit
  else
  echo $Number >> file.txt
  
read -p "Enter your email " email
fi
if [  -z  "$email" ]
  then exit
  else
  echo $email >> file.txt
  read -p "Enter your gender 1: Male 2:Female 3:Prefer not to say " gender
fi
if [[ "$gender" == "Male" || "$gender" == "Female" || "$gender" == "Prefer not to say" ]]
  then echo $gender >> file.txt
  else
  exit
  
fi
 
 