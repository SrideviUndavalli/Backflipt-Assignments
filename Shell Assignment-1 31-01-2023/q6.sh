#! /usr/bin/bash
#count files in a directory
mkdir a
cd a
touch read{1..10}
ls -lR | grep -c "^-"
