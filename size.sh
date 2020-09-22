#!/bin/bash

function server1 (){
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd2=$(df -h D:/ | grep 'D:' | cut -d ":" -f2 | cut -d "/" -f1)
backup=$(df -h //<backup server>/backup | grep backup | cut -d "/" -f1)

echo "$date C: $hdd1" >> //<log server>/global_logs/drive.$host.C.txt
echo "$date D: $hdd2" >> //<log server>/global_logs/drive.$host.D.txt
echo "$date <backup server>/backup $backup" >> //<log server>/global_logs/drive.<backup server>.backup.txt

unix2dos //<log server>/global_logs/drive.$host.C.txt
unix2dos //<log server>/global_logs/drive.$host.D.txt
unix2dos //<log server>/global_logs/drive.<backup server>.backup.txt
}

function server2(){
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd2=$(df -h E:/ | grep 'E:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd3=$(df -h F:/ | grep 'F:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd4=$(df -h G:/ | grep 'G:' | cut -d ":" -f2 | cut -d "/" -f1)

echo "$date C: $hdd1" >> //<log server>/global_logs/drive.$host.C.txt
echo "$date E: $hdd2" >> //<log server>/global_logs/drive.$host.E.txt
echo "$date F: $hdd3" >> //<log server>/global_logs/drive.$host.F.txt
echo "$date G: $hdd4" >> //<log server>/global_logs/drive.$host.G.txt

unix2dos //<log server>/global_logs/drive.$host.C.txt
unix2dos //<log server>/global_logs/drive.$host.E.txt
unix2dos //<log server>/global_logs/drive.$host.F.txt
unix2dos //<log server>/global_logs/drive.$host.G.txt
}

function server3(){
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
echo "$date C: $hdd1" >> //<log server>/global_logs/drive.$host.C.txt
unix2dos //<log server>/global_logs/drive.$host.C.txt
}


function server4(){
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd2=$(df -h D:/ | grep 'D:' | cut -d ":" -f2 | cut -d "/" -f1)
backup=$(df -h //<backup server>/backup | grep backup | cut -d "/" -f1)

echo "$date C: $hdd1" >> //<log server>/global_logs/drive.$host.C.txt
echo "$date D: $hdd2" >> //<log server>/global_logs/drive.$host.D.txt
echo "$date <backup server>/backup $backup" >> //<log server>/global_logs/drive.<backup server>.backup.txt

unix2dos //<log server>/global_logs/drive.$host.C.txt
unix2dos //<log server>/global_logs/drive.$host.D.txt
unix2dos //<log server>/global_logs/drive.<backup server>.backup.txt
}

function server5(){
hdd1=$(df -h C:/ | grep 'C:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd2=$(df -h E:/ | grep 'E:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd3=$(df -h F:/ | grep 'F:' | cut -d ":" -f2 | cut -d "/" -f1)
hdd4=$(df -h G:/ | grep 'G:' | cut -d ":" -f2 | cut -d "/" -f1)

echo "$date C: $hdd1" >> //<log server>/global_logs/drive.$host.C.txt
echo "$date E: $hdd2" >> //<log server>/global_logs/drive.$host.E.txt
echo "$date F: $hdd3" >> //<log server>/global_logs/drive.$host.F.txt
echo "$date G: $hdd4" >> //<log server>/global_logs/drive.$host.G.txt

unix2dos //<log server>/global_logs/drive.$host.C.txt
unix2dos //<log server>/global_logs/drive.$host.E.txt
unix2dos //<log server>/global_logs/drive.$host.F.txt
unix2dos //<log server>/global_logs/drive.$host.G.txt
}



date=$(date)
host=$(hostname)

$1
