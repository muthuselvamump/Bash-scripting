#!/bin/bash
while [ true ]
do

basename=`head -1 /home/elemental/moving_mgnl_to_mnt/mgnl_to_mnt_moving.txt`
l="/mnt/storage/transcoded/$basename/"
if [ $basename != "" ];
then
sed -i "/$basename\b/d" /home/elemental/moving_mgnl_to_mnt/mgnl_to_mnt_moving.txt

mkdir /mnt/storage/transcoded/$basename
echo "folder created in mnt storage on id no: $basename on `date`"
b=`find /mnt/MGNL3/DIGITAL/SUNOTT/Elemental/transcoded/ -name "$basename.sd5.mp4"`
echo "$basename file founded and copying file on mgnl to mnt at `date` "
cp "$b" $l
echo " $basename sucessfully_copied_mnt `date` " >> /home/elemental/moving_mgnl_to_mnt/mnt_copied.log
echo "$basename file sucefully copied `date`"

else
	echo "waiting for contend `date`"
	sleep 30
fi

basename=""

done
