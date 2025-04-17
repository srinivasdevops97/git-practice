#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days

USAGE(){
    echo "USAGE:: 20-backup.sh <SOURCE> <destination> <days(optional)>"
}
#check the source and destionation are provided

if [$# -lt 2 ]
then
    USAGE
fi