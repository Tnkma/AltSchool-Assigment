#!/bin/bash
# This script counts the number of files in a specified directory.

echo "Input directory absolute path:"

# Reads users input
read directory

# check if the directory exists
if [ -d "$directory" ]; then
    # count the number of files there
    files_count=$( ls -1 "$directory" | wc -l)

    # if files_count is less than 1, then the directory is empty
    if [ "$files_count" -lt 1 ]; then
        echo "This directory is empty."
    else
        echo "This directory contains $files_count files."
    fi
else
    echo "This directory does not exist."
fi
    
