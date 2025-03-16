#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))
USAGE(){
    echo -e "$R USAGE:: $N sudo sh 17-redirectors.sh Give number1 and number2"
    exit 1
}
if [ $# -ne 0 ]
then
    USAGE
fi

echo "Total of $NUMBER1 and $NUMBER2 is:$SUM"