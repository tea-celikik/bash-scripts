#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage $0 <username>"
    exit 1
fi

username="$1"

ps -ef | awk -v user="$username" '{ if ($1 == user) print $2 }' > temp.txt

cat temp.txt | while read pid
do
    count=$(ps -ef | awk -v p="$pid" '{ if ($3 == p) print }' | wc -l)
    echo "$pid има $count дете"
done
