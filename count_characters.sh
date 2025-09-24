#!/bin/bash


if [ $# -ne 1 ]; then
        echo "Usage $0 <filename>"
        exit 1
fi


file="$1"

if [ ! -f "$file" ]; then
        echo "The file $file does not exist!"
        exit 1
fi


count_characters=$(cat temp.txt | grep -v '^$' | grep -oE '[[:alnum:]]' | wc -l)


echo "The number of characters excluding spaces and special characters is $count_characters"
