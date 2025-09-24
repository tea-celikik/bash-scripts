#!/bin/bash


if [ $# -ne 1 ]; then
        echo "Usage $0 <filename>"
        exit 1
fi


file="$1"

if [ ! -f "$1" ]; then
        echo "The file $1 does not exist"
        exit 1
fi


if grep -q '^$' "$1"; then 
        grep -v '^$' "$1" > noEmptyLinesFile.txt 
        echo "The empty lines have been removed"
else
        echo "No empty lines to remove"
fi
