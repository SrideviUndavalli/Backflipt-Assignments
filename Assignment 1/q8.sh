#! /usr/bin/bash
#printing contents of base directories using switch
read -p "Enter the directory 1:doc for documents 2:dow for downloads 3: des for desktop" Directory
case $Directory in
[Dd][oO][cC])
ls -R -1  /c/Users/HP/documents
;;
[Dd][Ee][Ss])
ls -R -1 /c/Users/HP/OneDrive/Desktop
;;
[Dd][oO][wW])
ls -R -1 /c/Users/HP/downloads
;;
*)
echo "Invalid option"
exit
esac