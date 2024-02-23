#!/usr/bin/env bash
#
# AUTHOR: Rakesh Panigrahi
# Call REST APIs with cURL

API_URL="http://localhost:3000"

GET_API_URL="$API_URL/employees"

API_KEY="your_api_key"

#GET request with basic authentication
curl -X GET \
     -u "username:password" \
     "$GET_API_URL"
echo

# GET request with API key
echo "GET Request: $GET_API_URL"
curl -X GET \
     -H "Authorization: Bearer $API_KEY" \
     "$GET_API_URL"
echo

POST_API_URL="$API_URL/employees"
# JSON data for POST REQUEST
JSON_DATA='{"name":"Rakesh","email":"rakesh@example.com","department":"IT"}'

echo "POST Request: $POST_API_URL"
curl -X POST \
     -H "Authorization: Bearer $API_KEY" \
     -H "Content-Type: application/json" \
     -d "$JSON_DATA" \
     "$POST_API_URL"
echo

PUT_API_URL="$API_URL/employees/3"
# JSON data for PUT REQUEST
JSON_DATA='{"name":"Rakesh Panigrahi","email":"rkshp@example.com","department":"IT"}'

# PUT request with authentication
echo "PUT Request: $PUT_API_URL"
curl -X PUT \
     -H "Authorization: Bearer $API_KEY" \
     -H "Content-Type: application/json" \
     -d "$JSON_DATA" \
     "$PUT_API_URL"
echo

# DELETE request with authentication
DELETE_API_URL="$API_URL/employees/4"
echo "DELETE Request:$DELETE_API_URL"
curl -X DELETE \
     -H "Authorization: Bearer $API_KEY" \
     "$DELETE_API_URL"
echo
