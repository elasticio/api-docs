#Accounts

## Get user's accounts


> Example Request:


```shell
curl https://api.elastic.io/v1/accounts/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.accounts.list()
    .then(function(accounts) {
        // do something with the accounts
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
    {
        "id":"55083c567aea6f030000001a",
        "name":"My Dropbox account",
        "keys": {
            "oauth": {
                "key": "some key"
            }
        }
    }
]
```

This endpoint retrieves list of user's accounts

### HTTP Request

`GET https://api.elastic.io/v1/accounts/`


### Returns

Returns a list of accounts if the call succeeded.


## Get user's account


> Example Request:


```shell
curl https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.accounts.retrieve({ACCOUNT_ID})
    .then(function(account) {
        // do something with the account
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "55083c567aea6f030000001a",
    "name": "My Dropbox account",
    "type": "dropbox",
    "keys": {
        "oauth": {
            "key": "some key"
        }
    }
}
```

This endpoint retrieves one of user's accounts

### HTTP Request

`GET https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
ACCOUNT_ID | The ID of the account

### Returns

Returns an account object if the call succeeded.

## Add new account


> Example Request:


```shell
 curl https://api.elastic.io/v1/accounts/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "name": "My Dropbox account",
      "type": "dropbox",
      "keys": {
         "oauth": {
            "key": "some key"
      }
   }'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.accounts.create({
    "name": "My Dropbox account",
    "type": "dropbox",
    "keys": {
        "oauth": {
            "key": "some key"
        }
    }
}).then(function(account) {
    // do something with the account
});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "54982ee6bdf2a2030000000f",
  "name": "My Dropbox account",
  "type": "dropbox",
  "keys": {
    "oauth": {
      "key": "some key"
    }
  }
}
```

This endpoint adds new key to list of user's keys

### HTTP Request

`POST https://api.elastic.io/v1/accounts/`


### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
name | no | Account name
type | no | Account type (e.g. "dropbox")
keys | no | An object which represents component's configuration (OAuth keys, etc.)


### Returns

Returns account object if the call succeeded.



## Modify user's account


> Example Request:


```shell
curl https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/ \
   -u {EMAIL}:{APIKEY} \
   -X PUT \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
      {
          "name": "New account name"
      }'
```


```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.accounts.update({ACCOUNT_ID}, {
    "name": "New account name"
});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "55083c567aea6f030000001a",
    "name": "New account name",
    "type": "dropbox",
    "keys": {
        "oauth": {
            "key": "some key"
        }
    }
}
```

This endpoint modifies user's account

### HTTP Request

`PUT https://api.elastic.io/v1/accounts/{ACCOUNT_ID}/`

### URL Parameters

Parameter  | Description
---------- | -----------
ACCOUNT_ID | The ID of the account

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
name | no | Account name
type | no | Account type (e.g. "dropbox")
keys | no | An object which represents component's configuration (OAuth keys, etc.)

### Returns

Returns a modified account object if the call succeeded.
