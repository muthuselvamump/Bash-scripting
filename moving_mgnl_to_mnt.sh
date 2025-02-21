#!/bin/bash
while [ true ]
do

basename=`head -1 /path/path.txt`
l="/path/$basename/"
if [ $basename != "" ];
then
sed -i "/$basename\b/d" /path/path.txt

mkdir /path/$basename
echo "folder created in mnt storage on id no: $basename on `date`"
b=`find path -name "$basename.sd5.mp4"`
echo "$basename file founded and copying file on mgnl to mnt at `date` "
cp "$b" $l
echo " $basename sucessfully_copied_mnt `date` " >> /path/copied.log
echo "$basename file sucefully copied `date`"

else
	echo "waiting for contend `date`"
	sleep 30
fi

basename=""

done
