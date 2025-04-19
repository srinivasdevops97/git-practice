#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # in real projects, it is usually 75


while IFS= read -r line #IFS- internal field separator, empty means it will not ignore while spaces, -r is for not to ignore special characters like /
do
    echo $line
    rm -rf $file
done <<< $DISK_USAGE