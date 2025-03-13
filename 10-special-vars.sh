#!/bin/bash

echo "ALL variables passed to the script:$@"
echo "Number of variables passed:$#"
echo "Script name:$0"
echo "Current working directory:$PWD"
echo "Home directory of cuurent user:$HOME"
echo "PID of script executing now:$$"
sleep 100 &
echo "PID of last background command:$!"