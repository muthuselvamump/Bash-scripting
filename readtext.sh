#!/bin/bash

# Author : Muthuselvam
# Date Created : 11/05/2023
# Last Modified : 11/05/2023

# Description
# Read a text file and delete all lines

echo "Enter a file name : "
read name

if [ ! -s "${name}" ];
then
	echo "File is Empty"
	exit
fi

sno=1

while read line
do
	echo "$sno:$line"
	let sno++
done < $name

> $name

echo "Deleted all lines sucessfully"
