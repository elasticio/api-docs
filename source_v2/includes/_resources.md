# Resources

## Storage: Create a signed url

> Example Request:

```shell
curl {{ api_base_url }}/v2/resources/storage/signed-url \
   -X POST  \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "put_url":"https://steward_host/files/1ksksiaö",
  "get_url":"https://steward_host/files/34rwer34",
  "expires":18000
}
```

This endpoint creates a new signed url in Storage

### HTTP Request

`POST {{ api_base_url }}/v2/resources/storage/signed-url`


### Returns

Returns an HTTP 200 in case of successful url creation
