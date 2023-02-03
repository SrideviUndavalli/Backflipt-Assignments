
#prog to display names by passing them as arguments
#checking no of arguments passed
if [ $# -gt 0 ]
then
echo "no.of arguments $# "  #printing no .of arguments
echo "$@"                   #printing arguments passed
else
echo "no arguments passed"
exit
fi



