#!/bin/bash
#
# PURPOSE: Convert file contents to lower case

echo "Enter File path:"
read file

if [ -f "$file" ]; then   
	 dirname="$(dirname "$file")"
	 filename=$(basename "$file")
     fname="${filename%.*}"
	 ext="${filename##*.}"
     outputFile="$dirname/$fname-lower.$ext"
	 tr '[:upper:]' '[:lower:]' < "$file" >> "$outputFile"
	 echo "Converted file contents to lower case.Output Filpath: $outputFile"
 else
    echo "$file does not exists"
	exit 1    
fi
exit