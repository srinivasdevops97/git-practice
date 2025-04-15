#!/bin/bash

SOURCE_DIR =/home/ec2-user/logs

if [ $SOURCE_DIR -ne 0 ]
then
    echo "$SOURCE_DIR exists"
else
    echo "$SOURCE_DIR does not exists"
    exit 1
fi