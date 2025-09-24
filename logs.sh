#!/bin/bash


if [ $# -ne 2 ]; then
        echo "Usage $0: <STATUS> <MONTH>"
        exit 1
fi


status="$1"
month="$2"

if [[ ! "$month" =~ ^[0-9]{4}\-[0-9]{2}$ ]]; then
        echo "Invalid input of month, the format should be YYYY-MM"
        exit 1
fi

number_logs=$(cat system_logs.tsv | awk '{ print $1, $3 }' | awk '{ split($1,date,"-"); print date[1] "-" date[2], $2 }' | awk -v month="$month" -v status="$status" '{ if ($1 == month && $2 == status ) print $1, $2 }' | wc -l)
echo "Number of logs with status $status in month $month is: $number_logs"

common_ip=$(cat system_logs.tsv | awk '{ print $4, $3 }' | awk -v status="$status" '{ if ($2 == status) print $1 }' | sort -n | tail -1)
echo "Most Common IP address for logs with status $status: $common_ip"
count_per_status=$(cat system_logs.tsv | awk 'NR > 1 { print $3, $1 }' | awk '{ split($2,date,"-"); print $1, date[1] "-" date[2] }' | awk -v month="$month" '{ if ($2 == month) print }' | awk '{ count[$1]++; } END { for(status in count) printf "%s: %d\n", status, count[status] }' | sort)
echo "Count per status for month $month:"
echo "$count_per_status"
