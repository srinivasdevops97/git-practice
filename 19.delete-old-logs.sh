#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m

if [ -d $SOURCE_DIR ]
then
    echo -e "$G $SOURCE_DIR $N exists"
else
    echo -e "$R $SOURCE_DIR $N does not exists"
    exit 1
fi