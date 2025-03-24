#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date+ %Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
        if [ $USERID -ne 0 ]
            then
                echo -e "$R Please run this script with root privileges $N" &>>$LOG_FILE
                exit 1
        fi
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R Failed $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is $G Success $N" &>>$LOG_FILE
    fi
}

CHECK_ROOT


dnf list installed git


if [ $? -ne 0 ]
    then   
        echo "git is not installed, going to install it"
        dnf install git -y
        VALIDATE $? "Installing git"
    else
        echo "git is already installed.. Nothing to do"
fi

dnf list installed mysql
if [ $? -ne 0 ]
    then
        echo "mysql is not installed, going to install it"
        dnf install mysql -y  
        VALIDATE $? "Installing mysql"
    else
        echo "mysql is already installed.. Nothing to do"
fi
