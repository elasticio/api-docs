#SSH keys

## Retrieve all keys

> Example Request:


```shell
curl https://api.elastic.io/v2/sshkeys/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id": "589df8b024dbdd0e461fc309",
        "type": "sshkey",
        "attributes": {
            "title": "My Key",
            "fingerprint": "fingerprint",
            "user_id": "user_id",
            "key":"ssh_key"
        }
    }
]
```

This endpoint retrieves list of user's keys

### HTTP Request
`GET https://api.elastic.io/v2/sshkeys/`


### Returns
Returns a ssh key's metadata object if the call succeeded.















## Add new key

> Example Request:


```shell
    curl https://api.elastic.io/v2/sshkeys/ \
        -X POST \
        -u {EMAIL}:{APIKEY} \
        -H 'Accept: application/json' \
        -H 'Content-Type: application/json' -d '
        {
            "type": "sshkey",
            "attributes": {
                "key": "ssh-rsa YOUR KEY GOES HERE,
                "title": "My New Key"
            }
        }'
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

    {
        "id": "589df8a924dbdd0e461fc308",
        "type": "sshkey",
        "attributes": {
            "title": "My Key",
            "fingerprint": "fingerprint",
            "user_id": "user_id",
            "key":"ssh_key"
        }
    }
```

This endpoint adds new key to list of user's keys

### HTTP Request
`POST https://api.elastic.io/v2/sshkeys/`


### Arguments
Parameter        | Required | Description
---------------- | -------- | -----------
attributes.key   | yes      | valid RSA or DSA SSH public key
attributes.title | no       | key title


### Returns
Returns a ssh key's metadata object if the call succeeded.

















## Delete a key
> Example Request:


```shell
curl https://api.elastic.io/v2/sshkeys/{KEY_ID} \
   -X DELETE
   -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint delete specified ssh key

### HTTP Request
`DELETE https://api.elastic.io/v2/sshkeys/{KEY_ID}`


### URL Parameters
Parameter | Description
--------- | -----------
KEY_ID    | Key ID
