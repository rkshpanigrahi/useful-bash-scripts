#!/bin/bash
#
# SCRIPT: json_parser.sh
# AUTHOR: Rakesh Panigrahi
# PURPOSE: Script that parses JSON data

# Uncomment to check script syntax without execution
# set -n

# Uncomment to debug this script
# set -x

# Parse JSON from the Command Line
# echo "----------Parse JSON from the Command Line----------"
# cat data/employee.json | jq '.name, .age, .city'


# echo "----------Printing single Employee----------"

# # Parse JSON using jq
# name=$(jq -r '.name' data/employee.json)
# age=$(jq -r '.age' data/employee.json)
# city=$(jq -r '.city' data/employee.json)

# # Output the extracted values
# echo "Name: $name"
# echo "Age: $age"
# echo "City: $city"

# echo "Printing Array Of Employess---------------------------------"
 
# Parse JSON using jq
employees=$(jq '.employees' data/employee_arr.json)

# Iterate over each employee
for employee in $(echo "${employees}" | jq -c '.[]'); do
    name=$(echo "$employee" | jq -r '.name')
    email=$(echo "$employee" | jq -r '.email')
    department=$(echo "$employee" | jq -r '.department')
    echo "Name: $name, Email: $email, Department: $department"
done

