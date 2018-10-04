#!/bin/sh

time=$(date +"%T")
date=$(date +"%d.%m.%Y")
day=$(date +"%A")
uptime=$(uptime | awk -F '[ :,]' '{print $6 " days " $9 " hours " $10 " seconds "}')

echo ""
echo "Time:\t$time"
echo "Date:\t$date"
echo "Day:\t$day"
echo ""
echo "Uptime:\t$uptime"
echo ""
echo "Shell:\t$SHELL"
echo "User:\t$USER"
echo "Home:\t$HOME"
echo ""
df -H / | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $8}' | column -t
echo ""
