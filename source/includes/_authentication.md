
# Authentication

You authenticate to the elastic.io API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username. You do not need to provide a password.

```shell
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY}
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);
```