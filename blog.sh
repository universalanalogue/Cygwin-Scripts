#!/bin/bash

#log server ip
lgsvr=("")

if [[ $1 == site1 ]] ; then log1=server1 ; fi
if [[ $1 == site2 ]] ; then log1=server2 ; fi
#trigger on Log: Microsoft-Windows-Backup/Operational
# Event 4
if [ $2 -eq 1 ] ; then log2=("Backup Successful") ; fi
#trigger on Custom: Microsoft-Windows-Backup Level=1 2 3 or 5.
#Event 5,7-9,17,22,49,50,52,100,146,517-519,521,527,528,544-546,561,564,612,658
if [ $2 -eq 2 ] ; then log2=("Backup Failed") ; fi

start=$(powershell 'Get-WinEvent Microsoft-Windows-Backup |  Where-Object { $_.Id -eq '1' } | Select-Object -Property TimeCreated, ID' | sed "4q;d" | tr -d "\r")
end=$(powershell 'Get-WinEvent Microsoft-Windows-Backup |  Where-Object { $_.Id -eq '14' } | Select-Object -Property TimeCreated, ID' | sed "4q;d" | tr -d "\r")
start=$(echo ${start::-1})
end=$(echo ${end::-2})

echo "$start : $log2 : $end" >> //$lgsvr/global_logs/backup.$log1.log.txt
unix2dos //$lgsvr/global_logs/backup.$log1.log.txt

