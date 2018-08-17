
# Authentication

You authenticate to the {{ product_name }} API by providing your API key in the request.

Authentication to the API occurs via [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). Provide your email as the basic auth username and API key as the password.

```shell
curl {{ api_base_url }}/v1/users \
   -u {EMAIL}:{APIKEY}
```

```javascript
var client = require('{{ repo_name }}-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);
```