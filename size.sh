#!/bin/bash

# $1 is the name of the server running the script

#log server IP
lgsvr=("")

date=$(date)
host=$(hostname)

if [[ $1 =~ ^(server1|server2|server3|server4|server5)$ ]]
then
#read the capacity of the drive
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
#output it to the log server
echo "$date C: $hdd1" >> //$lgsvr/global_logs/drive.$host.C.txt
#convert the line endings to dos
unix2dos //$lgsvr/global_logs/drive.$host.C.txt
fi


if [[ $1 =~ ^(server1|server4)$ ]]
then
hdd1=$(df -h D:/ | grep 'D:' | cut -d ":" -f2 | cut -d "/" -f1)
echo "$date D: $hdd1" >> //$lgsvr/global_logs/drive.$host.D.txt
unix2dos //$lgsvr/global_logs/drive.$host.D.txt
#sets the IP for the backup target.
if [[ $1 == server1 ]] ; then bsvr=() ; fi
if [[ $1 == server4 ]] ; then bsvr=() ; fi
#reads the capacity of the backup target
backup=$(df -h //$bsvr/backup | grep backup | cut -d "/" -f1)
echo "$date $bsvr/backup $backup" >> //$lgsvr/global_logs/drive.$bsvr.backup.txt
unix2dos //$lgsvr/global_logs/drive.$bsvr.backup.txt
fi

if [[ $1 =~ ^(server2|server5)$ ]]
then
hdd2=$(df -h E:/ | grep 'E:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd3=$(df -h F:/ | grep 'F:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd4=$(df -h G:/ | grep 'G:' | cut -d ":" -f2 | cut -d "/" -f1)

echo "$date E: $hdd2" >> //$lgsvr/global_logs/drive.$host.E.txt
echo "$date F: $hdd3" >> //$lgsvr/global_logs/drive.$host.F.txt
echo "$date G: $hdd4" >> //$lgsvr/global_logs/drive.$host.G.txt

unix2dos //$lgsvr/global_logs/drive.$host.E.txt
unix2dos //$lgsvr/global_logs/drive.$host.F.txt
unix2dos //$lgsvr/global_logs/drive.$host.G.txt
fi
