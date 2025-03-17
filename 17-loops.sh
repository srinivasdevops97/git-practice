#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root privilages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.. $R FAILED $N"
        exit 1
    else
        echo -e "$2 is.. $G SUCCESS $N"
    fi
}


CHECK_ROOT

for Package in $@
do
    echo $Package
done