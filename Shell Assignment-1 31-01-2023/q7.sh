#! /usr/bin/bash
#making directory based on count of no of sub-directories present in it
mkdir a
cd a
mkdir {1..5}
count=$( ls -lR | grep -c "^d" )
if [ $count -lt 5 ]
then
mkdir Backflipt
elif [ $count -eq 5 ]
then mkdir Xenovus
else
echo "  Directory Creation Not Needed"
exit
fi

