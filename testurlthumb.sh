#!/bin/bash

for i in `cat moviesurls.txt`;
do
b=`curl $i`
if [ "$b"  == "Not found" ]
then
 echo $i >> notfoundmoviesurls.txt
fi

done
