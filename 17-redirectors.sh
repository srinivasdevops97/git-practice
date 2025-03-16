#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run the script with root privilages $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is.. $R FAILED $N"  | tee -a  $LOG_FILE
        exit 1
    else
        echo -e "$2 is.. $G SUCCESS $N"  | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 17-redirectors.sh package1  package2.."
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -ne 0 ]
then
    USAGE
fi

# sh 16-loops.sh git mysql postfix nginx
for Package in $@ #$@ refers to all arguments passed to it
do
    dnf list installed $Package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$Package is not installed, going to install it" | tee -a $LOG_FILE
        dnf install $Package -y &>>$LOG_FILE
        VALIDATE $? "Installing $Package"
    else
        echo -e "$Package is already $Y installed, nothing to do $N" | tee -a $LOG_FILE
    fi
done
