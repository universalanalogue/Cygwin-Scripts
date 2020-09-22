#!/bin/bash

if [ "$1" == site1 ]
then
srvip=("host1")
fi

if [ "$1" == site2 ]
then
srvip=("host2")
fi


while true ;do


#get a list of which vms are running (only works if vm names do not have spaces in them)
vm1=$(powershell Get-VM | grep Running | cut -d " " -f1)
#count the number of vms running
vm2=$(echo "$vm1" | wc -c)


#loop to shutdown the VMs saftly
if [ "$vm2" -gt 1 ]
then

echo "Stopping VMs"
for i in $vm1 ; do
powershell Stop-VM -Name "$i" &
done

sleep 120

else
echo "All VMs Stopped"
break
fi
done


#do the backup, finish this command

wbadmin start backup -backupTarget:\\\\"$srvip"\\backup\\server2019 -include:C:,D: -vssFull -quiet -systemState -allCritical

#give taskmanager time to log the events to log server
echo "Giving time to write logs before shutdown"
sleep 180

#do the nightly restart
shutdown /r /f /d p:4:1 /t 20
