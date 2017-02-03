#Organizations

## Create an organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "name": "My Org",
       "members": [
            {
                "email": "test@email.com",
                "role": "admin"
            }
       ]
   }'
```

```
 TBD
```

> Example Response:

```json
{ 
  "data":
    { 
      "id": "58455777a0aec4f377faefc1",
      "type": "organization",
      "attributes": { 
        "name": "My Org"
      } 
   },
  "meta": {} 
}

```

This endpoint allows to create an organization.


### HTTP Request

`POST https://api.elastic.io/v2/organizations`


#### Authorization

This request is authorized only for a user with a `TenantAdmin` role.


Parameter | Required | Description
--------- | ----------- | -----------
type | yes | A value should be "credential"
attributes.name | yes | Organization name


###Returns

Returns Organization object if the call succeeded











## Get organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}?include=members,invites \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```
 TBD
```

> Example Response:

```json
{
    "meta": {},
    "data": {
        "id": "58400dc7c9ab5757f8ef1f81",
        "type": "organization",
        "attributes": {
            "name": "horns&hoofs"
        },
        "relationships": {
            "members": {
                "data": [
                    {
                        "type": "member",
                        "id": "588f832b87d7c27c7d5cc37b"
                    },
                    {
                        "type": "member",
                        "id": "588f832b87d7c27c7d5cc37a"
                    }
                ],
                "links": {
                    "self": "/v2/organizations/58400dc7c9ab5757f8ef1f81/members"
                }
            },
            "invites": {
                "data": [
                    {
                        "type": "organization-invite",
                        "id": "588f832b87d7c27c7d5cc37e"
                    },
                    {
                        "type": "organization-invite",
                        "id": "588f832b87d7c27c7d5cc37f"
                    }
                ],
                "links": {
                    "self": "/v2/organizations/58400dc7c9ab5757f8ef1f81/members/pending"
                }
            }
        }
    },
    "included": [
        {
            "type": "member",
            "id": "588f832b87d7c27c7d5cc37a",
            "attributes": {
                "first_name": "Santos",
                "last_name": "Mitchell",
                "email": "Katelynn_Fritsch@gmail.com",
                "role": "admin"
            }
        },
        {
            "type": "member",
            "id": "588f832b87d7c27c7d5cc37b",
            "attributes": {
                "first_name": "Kacie",
                "last_name": "Howe",
                "email": "Rusty_Goodwin@hotmail.com",
                "role": "integrator"
            }
        },
        {
            "type": "organization-invite",
            "id": "588f832b87d7c27c7d5cc37e",
            "attributes": {
                "email": "invited-1@example.org",
                "role": "guest"
            }
        },
        {
            "type": "organization-invite",
            "id": "588f832b87d7c27c7d5cc37f",
            "attributes": {
                "email": "invited-2@example.org",
                "role": "integrator"
            }
        }
    ]
}

```

This endpoints returns an Organization object for certain organization id.


### HTTP Request

`GET https://api.elastic.io/v2/organizations/ORGANIZATION_ID/`

#### Authorization

Client has to be a member of the organization


### URL Parameters

Parameter  | Required | Description
---------- | ----------- | -----------
ORGANIZATION_ID | yes | The ID of the organization


### URL Query Parameters

Parameter   | Required | Description              
----------- | -------- | ------------------------ 
include     | no       | Whether include or not full resource objects in response for related entities. Possible values: `members` and/or `invites`.





## Invite a user to organization

> Example Request:

```shell
curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/invite \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "invite",
           "attributes": {
               "email": "user-to-invite@my-company.com",
               "role": "admin"
           }
       }
    }'
```

```
 TBD
```

> Example Response:

```json
{
   "data": {
       "type": "invite",
       "attributes": {
           "email": "user-to-invite@my-company.com",
           "role": "admin"
       }
   }
}

```

This endpoint allows to invite a user to organization.


### HTTP Request

`POST https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/invite`


#### Authorization
This request is authorized for a member of the organization or for a user with `TenantAdmin` role (contact support team to get this role).


Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "invite".
attributes.email | yes       | Email.
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns

Returns invite object if the call succeeded







## Add a new member to organization

> Example Request:

```shell
curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "member",
           "id": {USER_ID}
           "attributes": {
               "role": "admin"
           }
       }
    }'
```

```
 TBD
```

> Example Response:

```json
{
   "data": {
        "type": "member",
        "id": "588f832b87d7c27c7d5cc37a",
        "attributes": {
            "first_name": "Santos",
            "last_name": "Mitchell",
            "email": "Santos_Mitchell@example.com",
            "role": "admin"
        }
   }
}

```

This endpoint allows to add made a user member of certain organization. 
No invites will be sent, user became a member immediately. 


### HTTP Request

`POST https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members`


#### Authorization
This request is authorized for a user with `TenantAdmin` role only. Contact support team to get this role.


Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "member".
id               | yes       | id of an already registered user, who will be added as a member of the organization
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns

Returns member object if the call succeeded







##Remove member from organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{OrganizationId}/members/{UserId} \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}'
```

```
 TBD
```

> Example Response:

```shell
HTTP/1.1 200 OK
```

Operation requires organization admin access. Ownership of
user's Flows, Credentials, Lookups and Teams would be transferred to admin User performing this operation.

###Returns

Request returns 200 OK status code and empty body if succeeded.
