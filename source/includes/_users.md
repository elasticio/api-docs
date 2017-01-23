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
        "id": "54f4be3fe7d5224f91000002",
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
This request is authorized for a member of an organization or for a user with a role as `TenantAdmin`.

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
   -X POST \
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
This request is authorized only for a user with `TenantAdmin` role. 

### HTTP Request

`POST https://api.elastic.io/v2/users`

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
attributes.first_name | yes | The user's first name
attributes.last_name | yes | The user's last name
attributes.email | yes | The user's email
attributes.password | yes | The user's password. Must be at least 8 characters long.
attributes.company | no | The user's company

### Returns

New user objects will be provided with an ``id`` field - this value cannot be created or edited by clients.










## Delete a user

> Example Request:

```shell
curl https://api.elastic.io/v2/users/{USER_ID} \
   -X DELETE -u {EMAIL}:{APIKEY}
```

```javascript
//TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint performs delete of the user and associated data:


* all teams, where the user is the only member		
* component repositories, which belongs to deleted teams
* component builds, which belongs to deleted repositories
* lookups
* ssh keys
* credentials
* tasks (active tasks will be stopped)
* user's object itself
* all organizations, where the user is the only member


#### Not deleted immediately
These data objects are deleted automatically (e.g. due to expiration), hence won't be deleted right after user deletion:

* tasks activity records (which used in order to show runlog)
* logs of flow execution and repo build 
* invitations to a team or an organization 
* notifications (TBD)
* slugs (TBD)


#### Data associated with organization
User can not be deleted, if he is not the only member of any organization (e.g. there is at least one another member in an organization). The user should leave those organizations.

If the user is the only member of any organization(s), they will be deleted.



#### Public components
If there is any public component, associated to the user and the component is used in not deleted flows of someone else, the user can not be deleted automaticaly – contact technical support.

#### Authorization
You can delete yourself only, unless you have `TenantAdmin` role.

   
   

### HTTP Request

`DELETE https://api.elastic.io/v2/users/{USER_ID}`


### URL Parameters

Parameter  | Description
---------- | -----------
USER_ID | The ID of a user

