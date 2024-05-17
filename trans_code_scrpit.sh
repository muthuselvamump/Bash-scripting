#!/bin/bash

id="true"
while [ "$id" == "true" ]
do
	tvshow="/test_transcode/"
	tv="/test_transcode/condentIDs.txt"
	cd $tvshow
	conid=`head -1 /test_transcode/condentIDs.txt`
	exc="$conid"
	tes=".mp4"
	exc+="${tes}"
	echo $exc
	if [ "$conid" != "" ]
	then
		sed -i "/$conid\b/d" /test_transcode/condentIDs.txt
		ffmpeg -i "$exc" -b:v 1M out1M.mp4
		mv out1M.mp4 /media
		echo "changed bitrate 1mps successfully `date`" >> output1.log
	else
		echo "waiting for ne contend"
	fi
	sleep 10
done

