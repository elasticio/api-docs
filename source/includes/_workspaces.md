# Workspaces

## What is a Workspace unit?

A workspace is a space where every user can work on an integration project independently or in collaboration with other users. Every user is a member of at least one Workspace, but, each Workspace can have more than one member. All members of a Workspace have their access level or roles. There are only 3 roles:

- Workspace Admin - this role gives the holder all the rights within the Workspace unit
- Integrator - this role is granted for designing the integration process by building the flows, etc
- Guest - this role gives view-only rights to examine the work by Integrators

Each role is limited to the given Workspace only. The same user in the platform can have different roles in different Workspaces.

Request / Role|  Workspace Admin | Integrator | Guest|
---------- |:------------:| :-----------:| :----------:|
Get Workspace by ID|X| X|X|
Get User's Workspaces|X| X|X|
Add a new member to Workspace|X| -|-|
Update membership in Workspace|X |- |-|
Remove member from Workspace|X |- |-|
Delete Workspace|X |- |-|



## Get Workspace by ID

> Example Request:

```shell
 curl https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}?include=members,invites \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"59d341e9037f7200184a408b",
    "type":"workspace",
    "links":{
      "self":"/v2/workspaces/59d341e9037f7200184a408b"
    },
    "attributes":{
      "name":"My Workspace"
    },
    "relationships":{
      "contract":{
        "data":{
          "id":"5b4f337bff4304610483ba67",
          "type":"contract"
        },
        "links":{
          "self":"/v2/contracts/5b4f337bff4304610483ba67"
        }
      },
      "members":{
        "data":[
          {
            "id":"571634ecfdf77f0800000005",
            "type":"member"
          },
          {
            "id":"58c6b20124901200184fdfd1",
            "type":"member"
          }
        ],
        "links":{
          "self":"/v2/workspaces/59d341e9037f7200184a408b/members/"
        }
      },
      "invites":{
        "data":[
          {
            "id":"5b6460f73beeff001074af5b",
            "type":"workspace-invite"
          }
        ],
        "links":{
          "self":"/v2/workspaces/59d341e9037f7200184a408b/invites/"
        }
      }
    }
  },
  "meta":{

  },
  "included":[
    {
      "id":"560e5a27734d480a00000002",
      "type":"member",
      "links":{
        "self":"/v2/members/560e5a27734d480a00000002"
      },
      "attributes":{
        "first_name":"John",
        "last_name":"Doe",
        "role":"admin",
        "email":"john@doe.com"
      }
    },
    {
      "id":"5612c1e983dd4f0600000002",
      "type":"member",
      "links":{
        "self":"/v2/members/5612c1e983dd4f0600000002"
      },
      "attributes":{
        "first_name":"Bob",
        "last_name":"Smith",
        "role":"admin",
        "email":"bob@smith.com"
      }
    },
    {
      "id":"5b6460f73beeff001074af5b",
      "type":"workspace-invite",
      "links":{
        "self":"/v2/workspaces/59d341e9037f7200184a408b/invite/5b6460f73beeff001074af5b"
      },
      "attributes":{
        "email":"test@user.com",
        "role":"admin"
      }
    }
  ],
  "links":{
    "self":"/v2/workspaces/59d341e9037f7200184a408b"
  }
}
```

This endpoints returns a Workspace object for certain Workspace ID.


### HTTP Request

`GET https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/`

#### Authorization

User has to be a member of the Workspace.


### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | The ID of the Workspace


### URL Query Parameters
Parameter   | Required | Description              
----------- | -------- | ------------------------ 
include     | no       | Whether include or not full resource objects in response for related entities. Possible values: `members` and/or `invites`.





## Get User's Workspaces

> Example Request:

```shell
 curl https://api.elastic.io/v2/workspaces \
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
      "id":"59d341e9037f7200184a408b",
      "type":"workspace",
      "links":{
        "self":"/v2/workspaces/59d341e9037f7200184a408b"
      },
      "attributes":{
        "name":"My first Workspace"
      },
      "relationships":{
        "contract":{
          "data":{
            "id":"5b4f337bff4304610483ba67",
            "type":"contract"
          },
          "links":{
            "self":"/v2/contracts/5b4f337bff4304610483ba67"
          }
        },
        "members":{
          "data":[
            {
              "id":"571634ecfdf77f0800000005",
              "type":"member"
            },
            {
              "id":"58c6b20124901200184fdfd1",
              "type":"member"
            }
          ],
          "links":{
            "self":"/v2/workspaces/59d341e9037f7200184a408b/members/"
          }
        }
      }
    },
    {
      "id":"5b6d97bf033b500011fef487",
      "type":"workspace",
      "links":{
        "self":"/v2/workspaces/5b6d97bf033b500011fef487"
      },
      "attributes":{
        "name":"My second Workspace"
      },
      "relationships":{
        "contract":{
          "data":{
            "id":"5b4f337bff4304610483ba67",
            "type":"contract"
          },
          "links":{
            "self":"/v2/contracts/5b4f337bff4304610483ba67"
          }
        },
        "members":{
          "data":[
            {
              "id":"59d22e7eeb865b0018adc248",
              "type":"member"
            },
            {
              "id":"5b6d54a8bc7cf60010e34536",
              "type":"member"
            },
            {
              "id":"5b6da6e9bff5630010f2024f",
              "type":"member"
            }
          ],
          "links":{
            "self":"/v2/workspaces/5b6d97bf033b500011fef487/members/"
          }
        }
      }
    }
  ],
  "meta":{

  },
  "links":{
    "self":"/v2/workspaces"
  }
}
```

This endpoint returns a list of Workspaces which belong to the given User.


### HTTP Request

`GET https://api.elastic.io/v2/workspaces`

#### Authorization

User has to be a member of the Workspace.








## Get a list of members of Workspace

> Example Request:

```shell
 curl https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/ \
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
      "id":"59d22e7eeb865b0018adc248",
      "type":"member",
      "links":{
        "self":"/v2/members/59d22e7eeb865b0018adc248"
      },
      "attributes":{
        "first_name":"Marilyn",
        "last_name":"Manson",
        "role":"admin",
        "email":"marilyn@manson.com"
      }
    },
    {
      "id":"5b6da6e9bff5630010f2024f",
      "type":"member",
      "links":{
        "self":"/v2/members/5b6da6e9bff5630010f2024f"
      },
      "attributes":{
        "first_name":"Ozzy",
        "last_name":"Osborn",
        "role":"integrator",
        "email":"ozzy@osborn.com"
      }
    }
  ],
  "meta":{

  },
  "links":{
    "self":"/v2/workspaces/5b6d97bf033b500011fef487/members"
  }
}

```

This endpoints returns a list of all members of certain Workspace.


### HTTP Request

`GET https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/`

#### Authorization

User has to be a member of the Workspace.


### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | The ID of the Workspace






## Add a new member to Workspace

> Example Request:

```shell
curl https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/ \
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
    "id":"571634ecfdf77f0800000005",
    "type":"member",
    "links":{
      "self":"/v2/members/571634ecfdf77f0800000005"
    },
    "attributes":{
      "first_name":"Iggy",
      "last_name":"Pop",
      "role":"integrator",
      "email":"iggy@pop.com"
    }
  },
  "meta":{

  }
}

```

This endpoint allows adding a User to a certain Workspace as a member. You can add User only from Contract which current Workspace belong to.
Notification email will be sent. The User becomes a member immediately. 


### HTTP Request

`POST https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members`


#### Authorization
This request is authorized for a User with `Workspace Admin` role only.

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id               | yes       | id of an already registered user, who will be added as a member of the Workspace
type             | yes       | A value should be "member".
attributes.role  | yes       | Available roles are: admin, integrator and guest.


### Returns
Returns member object if the call succeeded









## Update membership in Workspace

> Example Request:

```shell
curl https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/ \
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

This endpoint allows updating a membership of a given User. Only `role` attribute can be updated. 


### HTTP Request
`PATCH https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for Workspace members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
WORKSPACE_ID  | The ID of the Workspace
USER_ID          | The ID of the User to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "member".
id               | yes       | id of an already registered User, must match URL param {USER_ID}
attributes.role  | yes       | Available roles are: admin, integrator and guest.


### Returns
Returns member object if the call succeeded








## Remove member from Workspace

> Example Request:

```shell
 curl https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/ \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```shell
HTTP/1.1 204 No Content
```

Remove a membership of the User in the Workspace.
Ownership of those user's associated data will be transferred to Admin User performing this operation:

* Flows
* Credentials
* DataSamples


### HTTP Request
`DELETE https://api.elastic.io/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for Workspace members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
WORKSPACE_ID  | The ID of the Workspace
USER_ID          | The ID of the user, which should leave the organization


### Returns
Responds with `204 No content` if the call succeeded (with empty body). 







## Delete Workspace

> Example Request:

```shell
 curl -i https://api.elastic.io/v2/workspaces/{WORKSPACE_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint will delete the Workspace along with the following items that were inside the Workspace:

* Credentials
* Agents
* DataSamples
* InviteTokens
* Lookups
* Flow's DynamicMetadata
* Flow's DynamicSelectModel
* Flow's ExecStat
* Flow's ExecutionResult
* Flow's MarathonEvent
* Flow's RequestBin
* Flow's TaskHooksData
* Flow's TaskStats
* Flow's TaskStatError
* Flow's TaskVersion

*Note, that process of deletion is asynchronous. Actual deletion of all data will be performed after API response, because it will take some time to terminate all containers of Workspace's flows. * 

### HTTP Request
`DELETE https://api.elastic.io/v2/workspaces/{WORKSPACE_ID} \`

#### Authorization
This request is authorized for organization members with role `Workspace Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
{WORKSPACE_ID}  | The ID of the Workspace


### Returns
Responds with `204 No content` if the call succeeded (with empty body).
