# Users

Request / Role| Tenant Admin | Contract Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Retrieve your user|X|X|X|X|
Retrieve a user by ID|X|-|-|-|
Retrieve all users|X|-|-|-|
Create a user|X|-|-|-|
Delete a user|X|-|-|-|

## Retrieve your user

> Example Request:

```shell
curl https://api.elastic.io/v2/users/me \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"59d22e7eeb865b0018adc248",
    "type":"user",
    "links":{
      "self":"/v2/users/59d22e7eeb865b0018adc248"
    },
    "attributes":{
      "first_name":"John",
      "last_name":"Doe",
      "email":"test@example.com",
      "company":"company",
      "registered":"2017-10-02T12:18:06.274Z",
      "last_login":"2018-03-15T16:53:57.696Z"
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve your user.

### HTTP Request

`GET https://api.elastic.io/v2/users/me`


#### Returns

Returns a user object if the call succeeded.






## Retrieve a user by ID

> Example Request:

```shell
curl https://api.elastic.io/v2/users/{USER_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"59d3562c68ed850019bde27f",
    "type":"user",
    "links":{
      "self":"/v2/users/59d3562c68ed850019bde27f"
    },
    "attributes":{
      "first_name":"John",
      "last_name":"Doe",
      "email":"test@example.com",
      "company":"company_name",
      "registered":"2017-10-03T09:19:40.598Z",
      "last_login":"2018-03-16T10:30:38.656Z"
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a user by ID.


### HTTP Request

`GET https://api.elastic.io/v2/users/{USER_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| USER_ID | yes | User identifier |


### Authorization
This request is authorized to a user with `TenantAdmin` role (contact support to get this role) can retrieve users from all Contracts of the Tenant.

#### Returns

Returns a user object if the call succeeded.









## Retrieve all users


> Example Request (with paging):

```shell
curl https://api.elastic.io/v2/users/?page[size]=1&page[number]=5 \
   -g \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response (with paging):

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":[
    {
      "id":"560e5a27734d480a00000002",
      "type":"user",
      "links":{
        "self":"/v2/users/560e5a27734d480a00000002"
      },
      "attributes":{
        "first_name":"John",
        "last_name":"Doe",
        "email":"test@example.com",
        "company":"company_name",
        "registered":"2015-10-02T10:19:19.697Z",
        "last_login":"2018-02-08T16:07:52.495Z"
      }
    }
  ],
  "meta":{
    "page":1,
    "per_page":1,
    "total":646,
    "total_pages":646
  }
}
```

> Example Request (default paging):

```shell
curl https://api.elastic.io/v2/users/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response (default paging):

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "meta":{
    "total":6,
    "page":1,
    "per_page":50,
    "total_pages":1
  },
  "data":[
    {
      "id":"588f8b04b84a6a7f3e47668d",
      "type":"user",
      "attributes":{
        "first_name":"Joannie",
        "last_name":"Smitham",
        "email":"client@my.org",
        "company":"Ward - Wiegand"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e47668e",
      "type":"user",
      "attributes":{
        "first_name":"Eulalia",
        "last_name":"Hyatt",
        "email":"user-2@my.org",
        "company":"Pfannerstill and Sons"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e47668f",
      "type":"user",
      "attributes":{
        "first_name":"Bertram",
        "last_name":"Davis",
        "email":"user-1@aliens.org",
        "company":"Auer, Ebert and Ledner"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476690",
      "type":"user",
      "attributes":{
        "first_name":"Marianne",
        "last_name":"Sawayn",
        "email":"client@outcast.org",
        "company":"O'Kon, Abshire and Dooley"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476691",
      "type":"user",
      "attributes":{
        "first_name":"Esta",
        "last_name":"Abbott",
        "email":"another@outcast.org",
        "company":"Turcotte - Christiansen"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476692",
      "type":"user",
      "attributes":{
        "first_name":"Kayleigh",
        "last_name":"Howell",
        "email":"tenant-admin@example.com",
        "company":"Zemlak, Thiel and O'Kon"
      }
    }
  ]
}
```



This endpoint returns a list of users.



### HTTP Request

`GET https://api.elastic.io/v2/users/`

### Query Parameters

| Parameter | Required | Description | Default |
| :--- | :--- | :--- | :--- |
| page\[size\] | No | Amount of items per page | 50 |
| page\[number\] | No | Number of page you want to display| 1 |


### Authorization

This request is authorized for a user with ``TenantAdmin`` role only. Contact support team to get this role.


#### Returns

Returns a list of user objects if the call succeeded.











## Create a user

> Example Request:

```bash
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
                "password": "secret11",
                "company": "Doe & Partners"
            },
            "relationships": {
                "contracts": {
                    "data": [
                        {"id": "54f4be3fe7d5224f91000001"}
                    ]
                }
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
    "id":"5aabc258bd6d6400079b4592",
    "type":"user",
    "links":{
      "self":"/v2/users/5aabc258bd6d6400079b4592"
    },
    "attributes":{
      "first_name":"John",
      "last_name":"Doe",
      "email":"test@example.com",
      "company":"Doe & Partners",
      "registered":"2018-03-16T13:10:48.221Z",
      "last_login":"2018-03-16T13:10:48.221Z"
    }
  },
  "meta":{}
}
```

This resource allows you to create a user.

### HTTP Request

`POST https://api.elastic.io/v2/users`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| attributes.first_name | yes | User's first name. |
| attributes.last_name | yes | User's last name. |
| attributes.email | yes | User's email. |
| attributes.password | yes | User's password. |
| attributes.company | no | User's company. |
| relationships.contracts.data | yes | Contract to join. |

### Authorization

This request is authorized only for a user with ``TenantAdmin`` role. Contact support team to get this role.

### Returns

New user objects will be provided with an ``id`` field - this value cannot be created or edited by clients.










## Delete a user

> Example Request:

```shell
curl https://api.elastic.io/v2/users/{USER_ID} \
    -X DELETE \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a user. When a user is deleted the following data will be deleted as well:


* all teams, where the user is the only member
* component repositories, which belongs to deleted teams
* component builds, which belongs to deleted repositories
* ssh keys
* credentials
* flows (active flows will be stopped)
* user's object itself
* all workspaces and contracts, where the user is the only member


### Not deleted immediately
These data objects are deleted automatically (e.g. due to expiration), hence won't be deleted right after user deletion:

* flows activity records (which used in order to show runlog)
* logs of flow execution and repo build
* invitations to a team or an contract
* notifications
* slugs (TBD)


### Data associated with contract

* If this user is a member of any Contract which has one more member beside him/her then this user needs to leave this Contract before his/her profile can be deleted.
* If this user is the only member of Contract(s) then he/she will be deleted along with all the unique data connected with this user.



### Authorization
This request is allowed with Tenant Admin API key.

   
   

### HTTP Request

`DELETE https://api.elastic.io/v2/users/{USER_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| USER_ID | yes | User identifier |

