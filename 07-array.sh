#!/bin/bash

#index starts from 0, size is 3
FRUITS=("APPLE" "KIWI" "ORANGE") #Array

echo "first fruit is: ${FRUITS[0]}"
echo "second fruit is: ${FRUITS[1]}"
echo "thrid fruit is: ${FRUITS[2]}"

echo "ALL fruits are: ${FRUITS[@]}"