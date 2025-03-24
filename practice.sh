#!/bin/bash


USERID=$(id -u)

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo "$2 is Failed"
        exit 1
    else
        echo "$2 is Success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

VALIDATE $? "Listing git"

# if [ $? -ne 0 ]
#     then   
#         echo "git is not installed, going to install it"
#         dnf install git -y
#         if [ $? -ne 0 ]
#             then
#                 echo "git installation is not successful, Please check"
#                 exit 1
#             else
#                 echo "git is installed successfully"
#         fi
#     else
#         echo "git is already installed.. Nothing to do"
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
#     then
#         echo "mysql is not installed, going to install it"
#         dnf install mysql -y  
#         if [ $? -ne 0 ]
#             then
#                 echo "mysql installation is not successful, Please check"
#                 exit 1
#             else
#                 echo "mysql is installed successfully"
#         fi
#     else
#         echo "mysql is already installed.. Nothing to do"
# fi