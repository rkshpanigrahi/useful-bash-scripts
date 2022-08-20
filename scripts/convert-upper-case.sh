#!/bin/bash
#
# PURPOSE: Convert file contents to upper case

echo "Enter File path:"
read file

if [ -f "$file" ]; then   
	 dirname="$(dirname "$file")"
	 filename=$(basename "$file")
     fname="${filename%.*}"
	 ext="${filename##*.}"
     outputFile="$dirname/$fname-upper.$ext"
	 tr '[:lower:]' '[:upper:]' < "$file" >> "$outputFile"
	 echo "Converted file contents to upper case.Output Filpath: $outputFile"
 else
    echo "$file does not exists"
	exit 1    
fi
exit