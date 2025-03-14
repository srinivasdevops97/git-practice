#!/bin/bash

USERID=$(id -u)
#echo "user id is:$USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. failed"
        exit 1
    else
        echo "$2 is.. success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf list installed git
VALIDATE $? "Listing git"

# if [ $? -ne 0 ]
# then
#     echo "git is not installed, going to install it.."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "git installation is failure, please check it"
#         exit 1
#     else
#         echo "git is installed successfully"
#     fi
# else
#     echo "git is already installed. Nothing to do.."
# fi
    
# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed, going to install it.."
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation failure, please check it"
#         exit 1
#     else
#         echo "mysql installation is successful"
#     fi
# else
#     echo "mysql is already installed, nothing to do.."
# fi