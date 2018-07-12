# Users

## Retrieve your user

> Example Request:

```shell
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.users.me()
    .then(function(user) {
        // do something with your user
    });
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com"
}
```

This endpoint returns your own user.

### HTTP Request

`GET https://api.elastic.io/v1/users`


#### Returns

Returns a user object if the call succeeded.


## Create a user

> Example Request:

```shell
curl https://api.elastic.io/v1/users \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
      "first_name": "John",
      "last_name": "Doe",
      "email": "test@example.com",
      "password": "secret",
      "company": "Doe & Partners",
      "organizations": [
        {"id": "54f4be3fe7d5224f91000001"}
      ]
   }'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.users.create({
    "first_name": "John",
    "last_name": "Doe",
    "email": "test@example.com",
    "password": "secret",
    "company": "Doe & Partners",
    "organizations": [
        {"id": "54f4be3fe7d5224f91000001"}
    ]
}).then(function(user) {
    // do something with the user
});
```

> Example Response:

```http
HTTP/1.1 201 OK
Content-Type: application/json

{
  "id": "54f4be3fe7d5224f91000001",
  "first_name": "John",
  "last_name": "Doe",
  "email": "test@example.com",
  "company": "Doe & Partners",
  "api_secret":"7a00b1ec-a0a8-4cea-84d2-d26052c8b788"
}
```

This endpoint registers a new user.

### HTTP Request

`POST https://api.elastic.io/v1/users`

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
first_name | yes | The user's first name
last_name | yes | The user's last name
email | yes | The user's email
password | yes | The user's password
organizations | yes | An array of organizations to join
company | no | The user's company
callback | no | Callback Url to call the result with

### Returns

#### No Callback Provided
A created user object.

New user objects will be provided with an ``id`` and ``api_secret`` fields - these values cannot be created or edited by clients.

The ``api_secret`` field is used to communicate with the API on user's behalf.

#### With Callback Provided

`{"message": "accepted"}`

When the user is created the provided ``callback_url`` will be called with the resulting user object.

New user objects will be provided with an ``id`` and ``api_secret`` fields - these values cannot be created or edited by clients.

The ``api_secret`` field is used to communicate with the API on user's behalf.


## Delete one of the created users

This method works with following limitations:

 - You can only delete users that you created
 - You can not delete a user who's identity is provided via authentication for a call

> Example Request:

```shell
curl https://api.elastic.io/v1/users/{USER_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
var client = require('elasticio-rest-node')(
    'YOUR_EMAIL', 'YOUR_API_KEY'
);

client.users.delete({USER_ID});
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "message" : "Successfully delete user id=123456789"
}
```

### HTTP Request

`DELETE https://api.elastic.io/v1/users/123456`

#### Returns

Returns an HTTP 200 in case of successful deletion
