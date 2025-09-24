#!/bin/bash


if [ $# -ne 1 ]; then
        echo "Usage $0 <directory>"
        exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
        echo "This is not a directory!"
        exit 1
fi


for file in "$directory"/*.txt 
do
        average=$(cat "$file" | grep 'Memory Available'  | awk '{ print $1, $2, $3 }' | sed 's/GB//' | awk '{ sum[$1] += $3; count[$1]++ } END { for(memory in sum) printf "%.2f\n", sum[memory]/count[memory] }')
        echo "File: $file"
        echo "Avg: $average"

done
