#!/bin/bash

# This script checks if a file exists or not

echo "Usage: ./check_file_exist.sh <filename>"

if [ -e "$1" ]
then
    echo "$1 exists in this directory"
else
    echo "$1 does not exist here"
fi

