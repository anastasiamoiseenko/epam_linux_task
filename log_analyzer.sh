#!/bin/bash
log_analyzer() {
echo "1. From which ip were the most requests?"
awk 'NF>0 {print $1}' $1 | sort | uniq -c | sort -nr | head -n 1

echo "2. What is the most requested page?"
awk 'NF>0 {print $7}' $1 | sort | uniq -c | sort -nr | head -n 1


echo "3. How many requests were there from each ip?"
awk 'NF>0 {print $1}' $1 | sort | uniq -c | sort -nr

echo "4. What non-existent pages were clients referred to?"
awk '$9 ~ /404/ {print $7 "    Error:"  $9}' $1

echo "5. What time did site get the most requests?"
awk '{print $4}' $1 | cut -d ':' -f 2 | uniq -c | sort -nr | head -n 1 | awk '{print "Hour: " $2 " (" $1 " times)"}'

echo "6. What search bots have accessed the site? (UA + IP)"
awk '/'bot'/ {print "IP:  " $1 "     " "UA  " $12}' $1
}

log_analyzer $1 > log_analyzer_result.txt