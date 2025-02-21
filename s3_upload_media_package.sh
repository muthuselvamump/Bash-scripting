#!/bin/bash

while [ true ]
do


sourcepath="/home/user"

        cd $sourcepath
        basename=`head -1 /home/user/upload_folder_for_mediapackage_demo.txt`
        if [ "$basename" != "" ]
        then
        cd /home/user/
        sed -i "/$basename\b/d" /home/user/upload_folder_for_mediapackage_demo.txt
        logupload="/home/user/logs/upload_"$basename".log"
        path=/mnt/storage/mediapackage/$basename/
        echo "$basename exists" >> $logupload
                echo "found $basename `date`" >> $logupload
                echo "starting uploading `date`" >> $logupload
                cd /home/user/
                /usr/local/bin/aws s3 sync  $path   s3://bucket-name/$basename/ >> $logupload
                echo "$basename `date`" >> $sourcepath/logs/upload_comp_idmp.txt
                echo "completed uploading `date`" >> $logupload
        else
        echo "waiting for new upload `date`"
        sleep 60
        fi

basename=""

done
