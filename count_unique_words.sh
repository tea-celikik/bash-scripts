#!/bin/bash


if [ $# -ne 1 ]; then
        echo "Usage $0 <filename>"
        exit 1
fi


file="$1"


if [ ! -f "$file" ]; then
        echo "The file $file does not exist"
        exit 1
fi


count_uniq=$(cat "$file" | grep -v '^$' | grep -oE '\b[a-zA-Z]+\b' | sort | uniq -c | awk 'BEGIN { count=0 } { if ( $1 == 1 ) count+=1; } END { print count }')

echo "The number of uniq words in $file is $count_uniq"
