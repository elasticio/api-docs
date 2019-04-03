# Workspaces

## What is a Workspace unit?

A Workspace is a space where every user can work on an integration project independently or in collaboration with other users. Each Workspace can have more than one member. All members of a Workspace have their roles. To get all available roles, please execute the "Get the Contract's roles" endpoint.
There is one predefined role - Workspace Owner. This role gives the holder all the rights within the Workspace unit, it cannot be deleted and the permissions’ set cannot be changed.
Each role is limited to the given Workspace only. The same user in the platform can have different roles in different Workspaces.

## Get Workspace by ID

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}?include=members,invites \
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
  "meta":{},
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
        "roles":[
          "admin"
        ],
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
        "roles":[
          "admin"
        ],
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
        "roles":[
          "admin"
        ]
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

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/`

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
 curl {{ api_base_url }}/v2/workspaces?contract_id={CONTRACT_ID} \
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
  "meta":{},
  "links":{
    "self":"/v2/workspaces"
  }
}
```

This endpoint returns a list of Workspaces which belong to the given User.


### HTTP Request

`GET {{ api_base_url }}/v2/workspaces?contract_id={CONTRACT_ID}`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
|contract_id|no|An Id of the Contract|

#### Authorization

User has to be a member of the Workspace.








## Get a list of members of Workspace

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/ \
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
        "roles":[
          "admin"
        ],
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
        "roles":[
          "integrator"
        ],
        "email":"ozzy@osborn.com"
      }
    }
  ],
  "meta":{},
  "links":{
    "self":"/v2/workspaces/5b6d97bf033b500011fef487/members"
  }
}

```

This endpoints returns a list of all members of certain Workspace.


### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/`

#### Authorization

User has to be a member of the Workspace.


### URL Parameters
Parameter       | Description
--------------- | -----------
WORKSPACE_ID | The ID of the Workspace



## Create a Workspace

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
     "data":{
       "type":"workspace",
       "attributes":{
         "name":"My test Workspace from API"
       },
       "relationships":{
         "contract":{
           "data":{
             "id":"{CONTRACT_ID}",
             "type":"contract"
           }
         }
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
    "id":"5b880121f3c1a800112a3bb3",
    "type":"workspace",
    "links":{
      "self":"/v2/workspaces/5b880121f3c1a800112a3bb3"
    },
    "attributes":{
      "name":"My first Workspace from API",
      "type":"full"
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
          }
        ],
        "links":{
          "self":"/v2/workspaces/5b880121f3c1a800112a3bb3/members/"
        }
      }
    }
  },
  "meta":{}
}

```

This endpoint allows creating a Workspace only by the User that is a member of the Contract's scope.


### HTTP Request

`POST {{ api_base_url }}/v2/workspaces`


#### Authorization

This request is authorized for the contract's scope members with the `contracts.workspace.create` permission. 

Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "workspace"
attributes.name | yes      | Name of the Workspace
relationships.contract.data.id | yes | An Id of the contract
relationships.contract.data.type | yes | A value must be "contract"

### Returns

Returns Workspace object if the call succeeded


## Update a Workspace

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
   "data":{
     "type":"workspace",
     "attributes":{
       "name":"New Workspace Name"
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
    "id":"{WORKSPACE_ID}",
    "type":"workspace",
    "links":{
      "self":"/v2/workspaces/{WORKSPACE_ID}"
    },
    "attributes":{
      "name":"New Workspace Name",
      "type":"full"
    },
    "relationships":{
      "contract":{
        "data":{
          "id":"{CONTRACT_ID}",
          "type":"contract"
        },
        "links":{
          "self":"/v2/contracts/{CONTRACT_ID}"
        }
      },
      "members":{
        "data":[
          {
            "id":"{USER_ID}",
            "type":"member"
          }
        ],
        "links":{
          "self":"/v2/workspaces/{WORKSPACE_ID}/members/"
        }
      }
    }
  },
  "meta":{}
}

```

This endpoint allows to update Workspace name.


### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}`


#### Authorization

This request is authorized for the contract's scope members with the `workspaces.workspace.edit` permission. 

Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "workspace"
attributes.name | yes      | Name of the Workspace


### Returns

Returns Workspace object if the call succeeded


## Add a new member to Workspace

> Example Request:

```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "member",
           "id": "{USER_ID}",
           "attributes": {
               "roles": [
                 "{ROLE_1}",
                 "{ROLE_2}"
               ]
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
      "roles": [
        "{ROLE_1}",
        "{ROLE_2}"
      ]
      "email":"iggy@pop.com"
    }
  },
  "meta":{}
}

```

This endpoint allows adding a User to a certain Workspace as a member. You can add User only from Contract which current Workspace belong to.
Notification email will be sent. The User becomes a member immediately. 


### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members`


#### Authorization
This request is authorized for a User with `workspaces.workspace.edit` permission only.

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id               | yes       | id of an already registered user, who will be added as a member of the Workspace
type             | yes       | A value should be "member".
attributes.roles[]  | yes       | To get all available roles, please execute the "Get the Contract's roles" endpoint.


### Returns
Returns member object if the call succeeded









## Update membership in Workspace

> Example Request:

```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "member",
           "id": "{USER_ID}",
           "attributes": {
               "roles": [
                 "{NEW_ROLE}"
               ]
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
      "roles": [
        "{NEW_ROLE}"
      ]
    }
  },
  "meta":{}
}

```

This endpoint allows updating a membership of a given User. Only `roles` attribute can be updated. 


### HTTP Request
`PATCH {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for Workspace members with permission `workspaces.workspace.edit`.

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
attributes.roles[]  | yes       | To get all available roles, please execute the "Get the Contract's roles" endpoint.


### Returns
Returns member object if the call succeeded








## Remove member from Workspace

> Example Request:

```shell
 curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/ \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```shell
HTTP/1.1 204 No Content
```

Remove a membership of the User in the Workspace.
Ownership of those user's associated data will be transferred to the User performing this operation:

* Flows
* Credentials
* DataSamples


### HTTP Request
`DELETE {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for Workspace members with permission `workspaces.workspace.edit`.

### URL Parameters
Parameter        | Description
---------------- | -----------
WORKSPACE_ID  | The ID of the Workspace
USER_ID          | The ID of the user, which should leave the Workspace


### Returns
Responds with `204 No content` if the call succeeded (with empty body). 







## Delete Workspace

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID} \
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
`DELETE {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID} \`

#### Authorization
This request can be performed by either the Contract’s user (the current Workspace assigned to) with the `contracts.workspace.delete`  permission or just the Workspace’s user with the  `workspaces.workspace.edit` permission.



### URL Parameters
Parameter        | Description
---------------- | -----------
{WORKSPACE_ID}  | The ID of the Workspace


### Returns
Responds with `204 No content` if the call succeeded (with empty body).
