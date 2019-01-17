# Users

## Retrieve your user

> Example Request:

```shell
curl {{ api_base_url }}/v2/users/me \
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
      "registered":"2017-10-02T12:18:06.274Z",
      "last_login":"2018-03-15T16:53:57.696Z"
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve your user.

### HTTP Request

`GET {{ api_base_url }}/v2/users/me`


#### Returns

Returns a user object if the call succeeded.






## Retrieve a user by ID

> Example Request:

```shell
curl {{ api_base_url }}/v2/users/{USER_ID} \
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
      "registered":"2017-10-03T09:19:40.598Z",
      "last_login":"2018-03-16T10:30:38.656Z"
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a user by ID.


### HTTP Request

`GET {{ api_base_url }}/v2/users/{USER_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| USER_ID | yes | User identifier |



#### Returns

Returns a user object if the call succeeded.









## Retrieve all users


> Example Request (with paging):

```shell
curl {{ api_base_url }}/v2/users/?page[size]=1&page[number]=5 \
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
curl {{ api_base_url }}/v2/users/ \
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
        "email":"client@my.org"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e47668e",
      "type":"user",
      "attributes":{
        "first_name":"Eulalia",
        "last_name":"Hyatt",
        "email":"user-2@my.org"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e47668f",
      "type":"user",
      "attributes":{
        "first_name":"Bertram",
        "last_name":"Davis",
        "email":"user-1@aliens.org"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476690",
      "type":"user",
      "attributes":{
        "first_name":"Marianne",
        "last_name":"Sawayn",
        "email":"client@outcast.org"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476691",
      "type":"user",
      "attributes":{
        "first_name":"Esta",
        "last_name":"Abbott",
        "email":"another@outcast.org"
      }
    },
    {
      "id":"588f8b04b84a6a7f3e476692",
      "type":"user",
      "attributes":{
        "first_name":"Kayleigh",
        "last_name":"Howell",
        "email":"tenant-admin@example.com"
      }
    }
  ]
}
```



This endpoint returns a list of users.



### HTTP Request

`GET {{ api_base_url }}/v2/users/`

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
curl {{ api_base_url }}/v2/users \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "data":{
         "type":"user",
         "attributes":{
           "first_name":"John",
           "last_name":"Doe",
           "email":"test@example.com",
           "password":"Secret1%"
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
      "registered":"2018-03-16T13:10:48.221Z",
      "last_login":"2018-03-16T13:10:48.221Z"
    }
  },
  "meta":{}
}
```

This resource allows you to create a user.

### HTTP Request

`POST {{ api_base_url }}/v2/users`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``user`` |
| attributes.first_name | yes | User's first name. |
| attributes.last_name | yes | User's last name. |
| attributes.email | yes | User's email. |
| attributes.password | yes | User's password. Password should be at least 8 characters long and include letters, numbers and special symbols.|


### Authorization

This request is authorized only for a user with ``TenantAdmin`` role. Contact support team to get this role.

### Returns

New user objects will be provided with an ``id`` field - this value cannot be created or edited by clients.










## Delete a user

> Example Request:

```shell
curl {{ api_base_url }}/v2/users/{USER_ID} \
    -X DELETE \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
```

This resource allows you to delete a user. 

### When a User is deleted the following data will be deleted as well:
* SSH keys
* User's object itself
* all Workspaces and Contracts, where the User is **the only member**


### Not deleted immediately
These data objects are deleted automatically (e.g. due to expiration), hence won't be deleted right after User deletion:
* flows activity records (which used in order to show runlog)
* logs of flow execution and repo build
* invitations to a team or an contract
* notifications
* slugs (TBD)


### Data associated with Contract and Workspace

* If this User is a member of any Contract which has one more Admin beside him/her then User's Teams and Repos will be transferred to the next Admin. 
* If this User is a member of any Workspace which has one more Admin beside him/her then User's Flows and Credentials will be transferred to the next Admin. 
* If this User is the last Admin of any Workspace then given Workspace will be deleted with all data. 
* If this User is the only member of Contract(s) then he/she will be deleted along with Contract and all the unique data connected with this User.



### Authorization
This request is authorized only for a User with ``TenantAdmin`` role. Contact support team to get this role. But any User also can delete himself/herself.

   
   

### HTTP Request

`DELETE {{ api_base_url }}/v2/users/{USER_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| USER_ID | yes | User identifier |

