# Users

## Retrieve your user

> Example Request:

```shell
curl https://api.elastic.io/v2/users/me \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "id": "54f4be3fe7d5224f91000001",
        "type": "user",
        "attributes": {
            "first_name": "John",
            "last_name": "Doe",
            "email": "test@example.com"
        }
    }
}
```

This endpoint returns your own user.

### HTTP Request

`GET https://api.elastic.io/v2/users/me`


#### Returns

Returns a user object if the call succeeded.






## Get a certain user

> Example Request:

```shell
curl https://api.elastic.io/v2/users/{USER_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "id": "54f4be3fe7d5224f91000001",
        "type": "user",
        "attributes": {
            "first_name": "John",
            "last_name": "Doe",
            "email": "test@example.com"
        }
    }
}
```

This endpoint returns requested user if the call succeeded.

### HTTP Request

`GET https://api.elastic.io/v2/users/{USER_ID}`

### URL Parameters

Parameter  | Description
---------- | -----------
USER_ID | The ID of a user


#### Returns

Returns a user object if the call succeeded.







## Create a user

> Example Request:

```shell
curl https://api.elastic.io/v2/users \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
        "data": {
            "type": "user",
            "attributes": {
                "first_name": "John",
                "last_name": "Doe",
                "email": "test@example.com",
                "password": "secret",
                "company": "Doe & Partners"
            }
        }
    }'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
    "data": {
        "id": "54f4be3fe7d5224f91000001",
        "type": "user",
        "attributes": {
            "first_name": "John",
            "last_name": "Doe",
            "email": "test@example.com",
            "company": "Doe & Partners"
        }
    }
}
```

This endpoint registers a new user.

### HTTP Request

`POST https://api.elastic.io/v2/users`

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
attributes.first_name | yes | The user's first name
attributes.last_name | yes | The user's last name
attributes.email | yes | The user's email
attributes.password | yes | The user's password
attributes.company | no | The user's company
???callback | no | Callback Url to call the result with

### Returns

#### No Callback Provided
A created user object.

New user objects will be provided with an ``id`` field - this value cannot be created or edited by clients.

#### With Callback Provided
????TBD
202 Accepted
`{"message": "accepted"}`

When the user is created the provided ``callback_url`` will be called with the resulting user object.

New user objects will be provided with an ``id`` field - this value cannot be created or edited by clients.






## Delete a user

This method works with following limitations:

 - You can only delete users that you created
 - You can not delete a user who's identity is provided via authentication for a call

> Example Request:

```shell
curl https://api.elastic.io/v2/users/{USER_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

### HTTP Request

`DELETE https://api.elastic.io/v2/users/123456`

#### Returns

Returns an HTTP 204 in case of successful deletion
