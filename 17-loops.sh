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

# sh 17-loops.sh git mysql postfix nginx
for Package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed, nothing to do"
    fi
done 