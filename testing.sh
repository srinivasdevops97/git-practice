#!/bin/bash

USERID= $(id -u)
#echo "user id is:$USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
    echo "git is not installed sucessfully, please check it"
        exit 1
    else
        echo "git is installed successfully"
    fi
else
    echo "git is already installed. Nothing to do.."
fi
    
