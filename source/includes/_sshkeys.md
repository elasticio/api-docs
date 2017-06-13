#SSH keys

## Retrieve all SSH keys

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

{
    "data": [
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
}
```

This resource allows you to retrieve all SSH keys of the current user.

### HTTP Request
`GET https://api.elastic.io/v2/sshkeys/`


### Returns
Returns an ssh key's metadata object if the call succeeded.















## Create a new SSH key

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

This resource allows you to create a new SSH key.

### HTTP Request
`POST https://api.elastic.io/v2/sshkeys/`


### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``sshkey`` |
| attributes.key | yes | A valid RSA or DSA SSH public key. |
| attributes.title | no | Title of the key |


### Returns
Returns an ssh key's metadata object if the call succeeded.

















## Delete a SSH key
> Example Request:


```shell
curl https://api.elastic.io/v2/sshkeys/{KEY_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a SSH key.

### HTTP Request
`DELETE https://api.elastic.io/v2/sshkeys/{KEY_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| KEY_ID | yes | SSH key ID |
