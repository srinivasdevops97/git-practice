#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE:: 20-backup.sh <SOURCE> <destination> <days(optional)>"
}
#check the source and destionation are provided

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

FILES=$(find {$SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

if [ ! -z FILES ] # true if FILES is empty, ! makes expression false
then
    echo "files are found"
    ZIP_FILE="DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "ZIP_FILE" -@

    #check if the zip file if successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zipped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS- internal field separator, empty means it will not ignore while spaces, -r is for not to ignore special characters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "zipping the files failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi