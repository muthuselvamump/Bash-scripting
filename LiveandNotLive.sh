#!/bin/bash
live=0
arr=()
count=-1
nl=0
nlc=0
echo "	RUNNING SERVICES"
printf "\n"
for i in `cat /root/scte/manifest/manifest.txt`;
do
code=`curl -s $i | grep EXTM3U`
if [[ "$code" != "" ]];
then
	url=`echo $i | awk -F '/' '{ print $5 }'`
	live=$((live+1))
	echo "$live" `echo $url`
else
	count=$((count+1))
	arr[count]=`echo $i | awk -F '/' '{ print $5 }'`
fi

done
printf "\n"
if [[ $count != -1 ]];
then
echo "	NOT RUNNING SERVICES"
for i in $(seq 0 $count);
do
nlc=$((nlc+1))
echo "$nlc  ${arr[nl]}"
nl=$((nl+1))
done
else
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fi
