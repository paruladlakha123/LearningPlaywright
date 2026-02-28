let statusCode = 401;

switch(statusCode){

case 200 :
console.log(`Status Code : ${statusCode} Result : PASS - OK: Request successful`);
break;

case 201 :
console.log(`Status Code : ${statusCode} Result : PASS - Created: Resource created successfully`);
break;

case 301 :
console.log(`StatusCode : ${statusCode} Result : WARNING - Moved Permanently: URL has changed`);
break;

case 400:
console.log(`Status Code : ${statusCode} Result : FAIL - Bad Request: Check request payload`);
break;

case 401:
console.log(`Status Code : ${statusCode} Result : FAIL - Unauthorized: Check auth token`);
break;

case 403:
console.log(`Status Code : ${statusCode} Result : FAIL - Forbidden: Insufficient permissions`);
break;

case 404:
console.log(`Status Code : ${statusCode} Result : FAIL - Not Found: Check endpoint URL`);
break;

case 500:
console.log(`Status Code : ${statusCode} Result : FAIL - Internal Server Error: Backend issue`);
break;

default :
console.log("UNKNOWN - Unhandled status code");
}