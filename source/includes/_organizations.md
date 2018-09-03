# Organizations (Deprecated)

## What is an Organizational unit?

Organizations or the Organizational unit is meant to closely resemble real-life company organization hierarchy and the management.
An Organization has an integration project which uses several in-house developed integration components. Each component has its own development team including members of your Organization as well as some contract developers.
To put this simply: the Organization can be used to encompass all of those development teams as well as to create the integration flows using all of those developed components. However, there are more features included in this unit. Here is a summary of capabilities that Organization can enable:

- Share integration tasks with colleagues
- Share secure account credentials
- Share private components

All of these possibilities can be enabled or disabled based on the level of access within the Organizational unit. All members of an Organization would have their access level or roles.
Currently, there are only 3 roles:

- Organization Admin - this role gives the holder all the rights within the Organizational unit
- Integrator - this role is usually granted for designing the integration process by building the flows, etc
- Guest - this role gives view-only rights to examine the work done by Integrators

Each role is limited to the given Organization only. The same user in the platform can have different roles in different Organizations

*Please note only the Tenant Administrator can create an Organizations unit and the first Admin for you. After the unit is created the Organization Admin can invite others and set their level of access. (Tenant is a higher structure, which includes all Organizations that belong to the white-label client)*


Request / Role| Tenant Admin | Organization Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Create an organization|X | -|- |-|
Get organization|X |X| X|X|
Get a list of members of Organization| -|X| X|X|
Get a list of pending members (invites) of Organization|- |X| X|X|
Invite a user to organization|X |X|- |-|
Add a new member to organization|X |-| -|-|
Update membership in Organization|- |X |- |-|
Remove member from organization|- |X |- |-|
Delete Organization|X |- |- |-|

## Create an organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
       {
           "data": {         
               "type": "organization",
               "attributes": {
                   "name": "My Org"
               }
           }
       }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"58455777a0aec4f377faefc1",
    "type":"organization",
    "links":{
      "self":"/v2/organizations/58455777a0aec4f377faefc1"
    },
    "attributes":{
      "name":"My Org"
    }
  },
  "meta":{}
}

```

This endpoint allows to create an organization.


### HTTP Request

`POST https://api.elastic.io/v2/organizations`


#### Authorization

This request is authorized to only a user with `TenantAdmin` role. Contact support team to get this role.


Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "organization"
attributes.name | yes      | Name of the organization


###Returns

Returns Organization object if the call succeeded











## Get organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}?include=members,invites \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "meta":{},
  "data":{
    "id":"58400dc7c9ab5757f8ef1f81",
    "type":"organization",
    "attributes":{
      "name":"horns&hoofs"
    },
    "relationships":{
      "members":{
        "data":[
          {
            "type":"member",
            "id":"588f832b87d7c27c7d5cc37b"
          },
          {
            "type":"member",
            "id":"588f832b87d7c27c7d5cc37a"
          }
        ],
        "links":{
          "self":"/v2/organizations/58400dc7c9ab5757f8ef1f81/members"
        }
      },
      "invites":{
        "data":[
          {
            "type":"organization-invite",
            "id":"588f832b87d7c27c7d5cc37e"
          },
          {
            "type":"organization-invite",
            "id":"588f832b87d7c27c7d5cc37f"
          }
        ],
        "links":{
          "self":"/v2/organizations/58400dc7c9ab5757f8ef1f81/members/pending"
        }
      }
    }
  },
  "included":[
    {
      "type":"member",
      "id":"588f832b87d7c27c7d5cc37a",
      "attributes":{
        "first_name":"Santos",
        "last_name":"Mitchell",
        "email":"Katelynn_Fritsch@gmail.com",
        "role":"admin"
      }
    },
    {
      "type":"member",
      "id":"588f832b87d7c27c7d5cc37b",
      "attributes":{
        "first_name":"Kacie",
        "last_name":"Howe",
        "email":"Rusty_Goodwin@hotmail.com",
        "role":"integrator"
      }
    },
    {
      "type":"organization-invite",
      "id":"588f832b87d7c27c7d5cc37e",
      "attributes":{
        "email":"invited-1@example.org",
        "role":"guest"
      }
    },
    {
      "type":"organization-invite",
      "id":"588f832b87d7c27c7d5cc37f",
      "attributes":{
        "email":"invited-2@example.org",
        "role":"integrator"
      }
    }
  ]
}
```

This endpoints returns an Organization object for certain organization id.


### HTTP Request

`GET https://api.elastic.io/v2/organizations/ORGANIZATION_ID/`

#### Authorization

Client has to be a member of the organization or to have `TenantAdmin` role (contact support team to get this role).


### URL Parameters
Parameter       | Description
--------------- | -----------
ORGANIZATION_ID | The ID of the organization


### URL Query Parameters
Parameter   | Required | Description              
----------- | -------- | ------------------------ 
include     | no       | Whether include or not full resource objects in response for related entities. Possible values: `members` and/or `invites`.







## Get a list of members of Organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/ \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "meta":{},
  "data":[
    {
      "type":"member",
      "id":"588f832b87d7c27c7d5cc37a",
      "links":{
        "self":"/v2/members/588f832b87d7c27c7d5cc37a"
      },
      "attributes":{
        "first_name":"Santos",
        "last_name":"Mitchell",
        "email":"Katelynn_Fritsch@gmail.com",
        "role":"admin"
      }
    },
    {
      "type":"member",
      "id":"588f832b87d7c27c7d5cc37b",
      "links":{
        "self":"/v2/members/588f832b87d7c27c7d5cc37b"
      },
      "attributes":{
        "first_name":"Kacie",
        "last_name":"Howe",
        "email":"Rusty_Goodwin@hotmail.com",
        "role":"integrator"
      }
    }
  ],
  "links":{
    "self":"/v2/organizations/{ORGANIZATION_ID}/members"
  }
}

```

This endpoints returns a list of all members of certain Organization.


### HTTP Request

`GET https://api.elastic.io/v2/organizations/ORGANIZATION_ID/members/`

#### Authorization

Client has to be a member of the organization.


### URL Parameters
Parameter       | Description
--------------- | -----------
ORGANIZATION_ID | The ID of the organization






## Get a list of pending members (invites) of Organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/invites/ \
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
      "id":"5aafd335bd6d6400079b4617",
      "type":"organization-invite",
      "links":{
        "self":"/v2/organizations/59d22e7eeb865b0018adc247/invite/5aafd335bd6d6400079b4617"
      },
      "attributes":{
        "email":"invited-1@example.org",
        "role":"integrator"
      }
    },
    {
      "id":"5aafda89bd6d6400079b4618",
      "type":"organization-invite",
      "links":{
        "self":"/v2/organizations/59d22e7eeb865b0018adc247/invite/5aafda89bd6d6400079b4618"
      },
      "attributes":{
        "email":"invited-2@example.org",
        "role":"guest"
      }
    }
  ],
  "meta":{}
}
```

This endpoints returns a list of pending members (invites) for certain Organization.


### HTTP Request

`GET https://api.elastic.io/v2/organizations/ORGANIZATION_ID/invites/`

#### Authorization

Client has to be a member of the organization.


### URL Parameters
Parameter       | Description
--------------- | -----------
ORGANIZATION_ID | The ID of the organization











## Invite a user to organization

> Example Request:

```shell
curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/invites/ \
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


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"5abceeb7bc984b00073976f6",
    "type":"organization-invite",
    "links":{
      "self":"/v2/organizations/59d22e7eeb865b0018adc247/invite/5abceeb7bc984b00073976f6"
    },
    "attributes":{
      "email":"user-to-invite@my-company.com",
      "role":"admin"
    }
  },
  "meta":{}
}

```

This endpoint allows to invite a user to organization.


### HTTP Request

`POST https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/invites/`


#### Authorization
This request is authorized for organization members with role `Admin` or `TenantAdmin`.


### URL Parameters
Parameter        | Description
---------------- | -----------
ORGANIZATION_ID  | The ID of the organization


### Payload Parameters
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
           "id": "{USER_ID}",
           "attributes": {
               "role": "{ROLE}"
           }
       }
    }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "type":"member",
    "id":"588f832b87d7c27c7d5cc37a",
    "attributes":{
      "first_name":"Santos",
      "last_name":"Mitchell",
      "email":"Santos_Mitchell@example.com",
      "role":"admin"
    }
  }
}

```

This endpoint allows adding a user to a certain organization as a member. 
No invitation email will be sent. The user becomes a member immediately. 


### HTTP Request

`POST https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members`


#### Authorization
This request is authorized for a user with `TenantAdmin` role only. Contact support team to get this role.

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id               | yes       | id of an already registered user, who will be added as a member of the organization
type             | yes       | A value should be "member".
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns
Returns member object if the call succeeded









## Update membership in Organization

> Example Request:

```shell
curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "member",
           "id": "{USER_ID}",
           "attributes": {
               "role": "{NEW_ROLE}"
           }
       }
    }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"59f747c33f1d3c001901a44e",
    "type":"member",
    "links":{
      "self":"/v2/members/59f747c33f1d3c001901a44e"
    },
    "attributes":{
      "role":"integrator"
    }
  },
  "meta":{}
}

```

This endpoint allows updating a membership of a given user. Only `role` attribute can be updated. 


### HTTP Request
`PATCH https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for organization members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
ORGANIZATION_ID  | The ID of the organization
USER_ID          | The ID of the user to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "member".
id               | yes       | id of an already registered user, must match URL param {USER_ID}
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns
Returns member object if the call succeeded








## Remove member from organization

> Example Request:

```shell
 curl https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/{USER_ID}/ \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```shell
HTTP/1.1 204 No Content
```

Remove a membership of the User in the Organization.
Ownership of those user's associated data will be transferred to admin User performing this operation:

* flows
* credentials
* lookups
* developers teams membership 


### HTTP Request
`DELETE https://api.elastic.io/v2/organizations/{ORGANIZATION_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for organization members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
ORGANIZATION_ID  | The ID of the organization
USER_ID          | The ID of the user, which should leave the organization


###Returns
Responds with `204 No content` if the call succeeded (with empty body). 







## Delete Organization

> Example Request:

```shell
 curl -i https://api.elastic.io/v2/organizations/{ORGANIZATION_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint will delete an Organization along with the following items that were inside the Organization:

* Accounts (Credentials)
* Agents
* DataSamples
* InviteTokens
* Lookups
* Flow's DynamicMetadata
* Flow's DynamicSelectModel
* Flow'sExecStat
* Flow's ExecutionResult
* Flow's MarathonEvent
* Flow's RequestBin
* Flow's TaskHooksData
* Flow's TaskStats
* Flow's TaskStatError
* Flow's TaskVersion
* Teams
* Repos
* RepoBuilds
* User accounts who were only the members of the deleted Organization


*An Organization cannot be deleted if any of its Components are used in another Organization's Flow*

### HTTP Request
`DELETE https://api.elastic.io/v2/organizations/{ORGANIZATION_ID} \`

#### Authorization
This request is authorized for organization members with role `Tenant Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
ORGANIZATION_ID  | The ID of the organization


### Returns
Responds with `204 No content` if the call succeeded (with empty body).
