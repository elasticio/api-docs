# SSH keys

Request / Role| Tenant Admin | Organization Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Retrieve all SSH keys|X*|X|X*|X*|
Create a new SSH key|X*|X|X*|X*|
Delete a SSH key|X*|X|X*|X*|

*- only for ssh-keys, which belong to this user

## Retrieve all SSH keys

> Example Request:


```shell
curl https://api.elastic.io/v2/sshkeys/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":[
    {
      "id":"5a4f59dbcbe7940019697ec5",
      "type":"sshkey",
      "links":{
        "self":"/v2/sshkeys/5a4f59dbcbe7940019697ec5"
      },
      "attributes":{
        "key":"ssh-key",
        "title":"test@example-UX430UQ",
        "fingerprint":"fd:d4:98:92:ed:d7:3a:0c:a2:42:ff:78:57:15:88:fa"
      },
      "relationships":{
        "user":{
          "data":{
            "id":"59d22e7eeb865b0018adc248",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/59d22e7eeb865b0018adc248"
          }
        }
      }
    }
  ],
  "meta":{},
  "links":{
    "self":"/v2/sshkeys"
  }
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
"data": {
        "type": "sshkey",
        "attributes": {
            "key": "ssh-rsa YOUR KEY GOES HERE",
           "title": "My New Key"
         }
    }
}'
```


> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data":{
    "id":"5aabedf5bd6d6400079b45f1",
    "type":"sshkey",
    "links":{
      "self":"/v2/sshkeys/5aabedf5bd6d6400079b45f1"
    },
    "attributes":{
      "key":"ssh-key",
      "title":"1603testAndDelMe",
      "fingerprint":"3a:2b:8e:7c:dc:82:3e:de:54:f4:58:8a:7d:55:fb:15"
    },
    "relationships":{
      "user":{
        "data":{
          "id":"59d22e7eeb865b0018adc248",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/59d22e7eeb865b0018adc248"
        }
      }
    }
  },
  "meta":{}
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
