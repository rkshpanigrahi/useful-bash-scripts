#!/usr/bin/env bash
#
# AUTHOR: Rakesh Panigrahi
# Call REST APIs with cURL

API_URL="http://localhost:3000"

GET_API_URL="$API_URL/employees"

# GET request
echo "GET Request: $GET_API_URL"
curl -X GET "$GET_API_URL"
echo 


POST_API_URL="$API_URL/employees"
# JSON data for POST REQUEST
JSON_DATA='{"name":"Rakesh","email":"rakesh@example.com","department":"IT"}'

echo "POST Request:$POST_API_URL"
curl -X POST \
     -H "Content-Type: application/json" \
     -d "$JSON_DATA" \
     "$POST_API_URL"
echo

PUT_API_URL="$API_URL/employees/3"
# JSON data for PUT REQUEST
JSON_DATA='{"name":"Rakesh Panigrahi","email":"rkshp@example.com","department":"IT"}'

echo "PUT Request:$PUT_API_URL"
curl -X PUT \
     -H "Content-Type: application/json" \
     -d "$JSON_DATA" \
     "$PUT_API_URL"
echo

DELETE_API_URL="$API_URL/employees/4"
echo "DELETE Request:$DELETE_API_URL"
curl -X DELETE "$DELETE_API_URL"
echo
