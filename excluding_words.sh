#!/bin/bash

excluding_words=( "Bash" "Shell" )

count_lines=$(cat file.txt | grep -oE '\b\w+\b' | grep -vFw -f <(printf "%s\n" "${excluiding_words[@]}" | wc -w )

echo "The number of words excluidng the words ${excluding_words[@]} is $count_lines"
