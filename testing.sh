#!/bin/bash

USERID= $(id -u)
#echo "user id is:$USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it.."
    dnf install mysql
    if [ $? -ne 0 ]
    then
    echo"mysql is not installed, please check it"
    exit 1
    else
    echo "mysql is installed successfully"
    fi
else
    echo "mysql is already installed. Nothing to do.."
fi
    
