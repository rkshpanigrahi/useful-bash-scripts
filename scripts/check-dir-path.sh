#!/bin/bash
#
# PURPOSE: check directory path if present or not

echo "Please provide Directory name (using the absolute path)"
read path
 
if [ -d "$path" ]; then
    echo "$path does  exist"
else
	echo "$path does not exist"
	exit 1
fi
exit