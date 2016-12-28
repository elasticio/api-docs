# Status Codes

## Success

The elastic.io API responds with following status codes upon successful requests:


Status Code | Meaning
---------- | -------
200 | Ok -- Successful HTTP requests
201 | Created --  requested resource has been created successfully

## Errors

The elastic.io API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The kitten requested is hidden for administrators only
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
409 | The resource object’s type is not among the type(s) that constitute the collection represented by the endpoint
or a POST request to create a resource with a client-generated ID that already exists..
410 | Gone -- The resouce requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too many resources! Slown down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarialy offline for maintanance. Please try again later.