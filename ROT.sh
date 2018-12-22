#!/bin/bash

Red='\033[0;31m'
Green='\033[1;32m'
LightBlue='\033[1;34m'
LightPurple='\033[1;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NoColor='\033[0m'

USAGE="\n${Yellow}./ROT <string> <rotation>\nUsage example: ./ROT abc 13 \nNB :( 0 < rotation < 26)\n"

if [ -f "$1" ]; then
	CONTENT=$(cat $1)
elif [ -n "$1" ]; then
	CONTENT=$1
else
	printf "$USAGE"
	echo "Invalid string input"
	exit 1
fi

if [[ $2 > 0 && $2 < 26 ]]; then
ROTASCIImin1=$(echo $2 + 97 | bc)
ROTASCIImin2=$(echo $2 + 96 | bc)
ROTASCIImaj1=$(echo $2 + 65 | bc)
ROTASCIImaj2=$(echo $2 + 64 | bc)
ASCII2CHARmin1=$(printf "\\$(printf '%03o' "$ROTASCIImin1")")
ASCII2CHARmin2=$(printf "\\$(printf '%03o' "$ROTASCIImin2")")
ASCII2CHARmaj1=$(printf "\\$(printf '%03o' "$ROTASCIImaj1")")
ASCII2CHARmaj2=$(printf "\\$(printf '%03o' "$ROTASCIImaj2")")

echo "== ROT$2 result :"
echo "- $1" | eval tr '[a-z]' '[$ASCII2CHARmin1-za-$ASCII2CHARmin2]' | eval tr '[A-Z]' '[$ASCII2CHARmaj1-ZA-$ASCII2CHARmaj2]'
exit 0

else
	printf "$USAGE"
	exit 1
fi

