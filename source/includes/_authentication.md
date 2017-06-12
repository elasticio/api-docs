
# Authentication

You authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your email as the basic auth username and API key as the password.

```shell
curl https://api.elastic.io/v2/users/me \
   -u {EMAIL}:{APIKEY}
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);
```