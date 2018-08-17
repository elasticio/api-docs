# Resources

## S3: Create a signed url

> Example Request:

```shell
curl {{ api_base_url }}/v1/resources/s3/signed-url \
   -X POST  \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.resources.s3
    .createSignedUrl()
    .then(function(result) {
        // do something with the result
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "put_url": "https://bucket.region.amazonaws.com/put",
  "get_url": "https://bucket.region.amazonaws.com/get",
  "expires": 18000
}
```

This endpoint creates a new signed url in S3

### HTTP Request

`POST {{ api_base_url }}/v1/resources/s3/signed-url`


### Returns

Returns an HTTP 200 in case of successful url creation
