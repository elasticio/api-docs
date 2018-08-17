#SSH keys

## Retrieve all keys


> Example Request:


```shell
curl {{ api_base_url }}/v1/sshkey/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.sshkeys.list()
    .then(function(keys) {
        // do something with the keys
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id": "54982ee6bdf2a2030000000f",
    "title": "My Key",
    "fingerprint": "fingerprint",
    "user_id": "user_id",
    "key":"ssh_key"
  }
]
```

This endpoint retrieves list of user's keys

### HTTP Request

`GET {{ api_base_url }}/v1/sshkey/`


### Returns

Returns a ssh key's metadata object if the call succeeded. The returned object will have an keys's title, id and fingerPrint metadata.


## Add new key


> Example Request:


```shell
 curl {{ api_base_url }}/v1/sshkey/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "key": "ssh-rsa YOUR KEY GOES HERE,
       "title": "My Key"
   }'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.sshkeys.create({
    "key": "ssh-rsa YOUR KEY GOES HERE",
    "title": "My Key"
}).then(function(key) {
    // do something with the key
});
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
  "id": "54982ee6bdf2a2030000000f",
  "title": "My Key",
  "fingerprint": "fingerprint",
  "user_id": "user_id",
  "key":"ssh_key"
}
```

This endpoint adds new key to list of user's keys

### HTTP Request

`POST {{ api_base_url }}/v1/sshkey/`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
key       | yes | valid RSA or DSA SSH public key
title     | no | key title


### Returns

Returns a ssh key's metadata object if the call succeeded. The returned object will have an keys's title, id and fingerPrint metadata.


## Delete a key


> Example Request:


```shell
curl {{ api_base_url }}/v1/sshkey/{KEY_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -X DELETE
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.sshkeys.delete({KEY_ID});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{}
```

This endpoint delete specified ssh key

### HTTP Request

`DELETE {{ api_base_url }}/v1/sshkey/{ID}`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
KEY_ID    | yes | Key ID


### Returns

Returns empty response on success request
