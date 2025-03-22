#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
    then   
        echo "git is not installed, going to install it"
        dnf install git -y
        if [ $? -ne 0 ]
            then
                echo "git installation is not successful, Please check"
            else
                echo "git is installed successfully"
        fi
    else
        echo "git is already installed.. Nothing to do"
fi

