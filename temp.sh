#!/bin/bash

# This script requires a Dell Server with OpenManage installed.
# $1 is the site id
date=$(date)
temp=$(omreport chassis temps index=1 | grep "Reading" | cut -d ":" -f2)
echo "$date Temp:$temp" >> //<log server>/global_logs/temp.$1.txt
unix2dos //<log server>/global_logs/temp.$1.txt
