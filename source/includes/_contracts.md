# Contracts

## What is a Contract unit?

A Contract is a structural entity which reflects an agreement Contract between a customer and the platform provider. It can have an unlimited number of members, workspaces and development teams. The purpose of the Contract is to manage all members, workspaces and development teams. It also serves a singular entity for the billing against the consumed resources by all the integration flows.

Every member of the Contract has one unique access level or role within the current Contract: `Contract Admin`, `Integrator` or a `Guest`. The same user in the platform can have different roles in different Contracts.

*Please note only the Tenant Admin can create a Contracts unit and the first Contract Admin. After the unit is created the Contract Admin can invite others and set their level of access. (Tenant is a higher structure, which includes all Contracts that belong to the white-label client).*

The table below lists the access roles against the performed API requests: 


Request / Role                                      | Tenant Admin  | Contract Admin    | Integrator    | Guest
----------                                          | :-----------: | :---------------: | :-----------: | :----------:
Create a contract                                   |X              |-                  |-              |-              |
Get contract by Id                                  |X              |X                  |X              |X              |
Get contracts                                       |-              |X                  |X              |X              |
Get a list of members of contract                   |-              |X                  |X              |X              |
Get a list of pending members (invites) of contract |-              |X                  |X              |X              |
Invite a user to contract                           |X              |X                  |-              |-              |
Add a new member to contract                        |X              |X                  |-              |-              |
Update membership in contract                       |-              |X                  |-              |-              |
Remove member from contract                         |-              |X                  |-              |-              |
Delete contract                                     |X              |-                  |-              |-              |
Create a workspace                                  |-              |X                  |X              |X              |

## Create a Contract

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
       {
           "data": {         
               "type": "contract",
               "attributes": {
                   "name": "My Contract"
               }
           }
       }'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "id": "5b87aded2dfb980011537690",
        "type": "contract",
        "links": {
            "self": "/v2/contracts/5b87aded2dfb980011537690"
        },
        "attributes": {
            "name": "My Contract"
        }
    },
    "meta": {}
}

```

This endpoint allows to create a Contract.


### HTTP Request

`POST https://api.elastic.io/v2/contracts`


#### Authorization

This request is authorized to only a user with `TenantAdmin` role. Contact support team to get this role.


Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "contract"
attributes.name | yes      | Name of the Contract


### Returns

Returns Contract object if the call succeeded











## Get Contract by Id

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}?include=members,invites \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"5b4f3e093a472b0006c71d47",
    "type":"contract",
    "links":{
      "self":"/v2/contracts/5b4f3e093a472b06c71d47"
    },
    "attributes":{
      "name":"LucontractOne"
    },
    "relationships":{
      "members":{
        "data":[
          {
            "id":"59d22eeb865b0018adc248",
            "type":"contract-member"
          },
          {
            "id":"5a1c298abe7a00189caf76",
            "type":"contract-member"
          }
        ],
        "links":{
          "self":"/v2/contracts/5b4f3e093a472b06c71d47/members/"
        }
      },
      "invites":{
        "data":[
          {
            "id":"5b6d8ce8033b0011fef43e",
            "type":"contract-invite"
          }
        ],
        "links":{
          "self":"/v2/contracts/5b4f3e093a4b0006c71d47/invites/"
        }
      }
    }
  },
  "meta":{

  },
  "included":[
    {
      "id":"59d22e7eebrr5b0018adc248",
      "type":"contract-member",
      "attributes":{
        "first_name":"Alla",
        "last_name":"Ospik",
        "role":"admin",
        "email":"alla.ospik@elastic.io"
      },
      "relationships":{
        "user":{
          "data":{
            "id":"59d22e7eeb865bee18adc248",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/59d22e7eeb865bee18adc248"
          }
        }
      }
    },
    {
      "id":"5a1c298a75be7aee189caf76",
      "type":"contract-member",
      "attributes":{
        "first_name":"Henry",
        "last_name":"Pushkin",
        "role":"admin",
        "email":"henry@elastic.io"
      },
      "relationships":{
        "user":{
          "data":{
            "id":"5a1c298a75be7aee189caf76",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/5a1c298a75be7aee189caf76"
          }
        }
      }
    }
  ],
  "links":{
    "self":"/v2/contracts/5b4f3e093a472b0ee6c71d47"
  }
}
```

This endpoints returns a Contract object for certain contract id.


### HTTP Request

`GET https://api.elastic.io/v2/contracts/CONTRACT_ID/`

#### Authorization

Client has to be a member of the Contract or to have `TenantAdmin` role (contact support team to get this role).


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract


### URL Query Parameters
Parameter   | Required | Description              
----------- | -------- | ------------------------ 
include     | no       | Whether include or not full resource objects in response for related entities. Possible values: `members` and/or `invites`.



## Get Contracts

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts/
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id":"5b4f3379ff4305510483ba1a",
      "type":"contract",
      "links":{
        "self":"/v2/contracts/5b4f3379ff4304655483ba1a"
      },
      "attributes":{
        "name":"LuzhaOrg"
      },
      "relationships":{
        "members":{
          "data":[
            {
              "id":"5967519b2d8ff5501871dc39",
              "type":"contract-member"
            },
            {
              "id":"59bfb6958aa5555519ab26f1",
              "type":"contract-member"
            },
            {
              "id":"59d22e7eeb865b558adc248",
              "type":"contract-member"
            }
          ],
          "links":{
            "self":"/v2/contracts/5b4f3379ff455610483ba1a/members/"
          }
        }
      }
    },
    {
      "id":"5b76b1e104da8244038d5c9",
      "type":"contract",
      "links":{
        "self":"/v2/contracts/5b76b1e104da82441038d5c9"
      },
      "attributes":{
        "name":"FridayContract"
      },
      "relationships":{
        "members":{
          "data":[
            {
              "id":"5773e8e26e05f10ert0000003",
              "type":"contract-member"
            },
            {
              "id":"59d22e7eeb865berrt18adc248",
              "type":"contract-member"
            }
          ],
          "links":{
            "self":"/v2/contracts/5b76b1e104daer001038d5c9/members/"
          }
        }
      }
    }
  ],
  "meta":{

  }
}
```

This endpoints returns all Contract objects for certain user.


### HTTP Request

`GET https://api.elastic.io/v2/contracts/`

#### Authorization

Client has to be a member of a Contract.



## Get a list of members of Contract

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/ \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":[
    {
      "id":"59d22e7eeb865bee18adc248",
      "type":"contract-member",
      "attributes":{
        "first_name":"Hanna",
        "last_name":"Yutsenko",
        "role":"admin",
        "email":"hanna.yutsenko@elastic.io"
      },
      "relationships":{
        "user":{
          "data":{
            "id":"59d22e7eeb86544018adc248",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/59d22e7eeb865b4418adc248"
          }
        }
      }
    },
    {
      "id":"5a1c298a75be7a44489caf76",
      "type":"contract-member",
      "attributes":{
        "first_name":"Ksu",
        "last_name":"Luzha",
        "role":"admin",
        "email":"margarita@elastic.io"
      },
      "relationships":{
        "user":{
          "data":{
            "id":"5a1c298a75be7a44189caf76",
            "type":"user"
          },
          "links":{
            "self":"/v2/users/5a1c298a75be7a44189caf76"
          }
        }
      }
    }
  ],
  "meta":{

  },
  "links":{
    "self":"/v2/contracts/5b4f3e093a47244006c71d47/members"
  }
}

```

This endpoints returns a list of all members of certain Contract.


### HTTP Request

`GET https://api.elastic.io/v2/contracts/CONTRACT_ID/members/`

#### Authorization

Client has to be a member of the Contract.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract






## Get a list of pending members (invites) of Contract

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/invites/ \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": [
        {
            "id": "5b6d663b033b550011fef351",
            "type": "contract-invite",
            "attributes": {
                "email": "hanna+jflcc53gflsbjfbj@elastic.io",
                "role": "admin"
            }
        },
        {
            "id": "5b83c0462e7785501158b654",
            "type": "contract-invite",
            "attributes": {
                "email": "hanna+2708test1@elastic.io",
                "role": "integrator"
            }
        },
        {
            "id": "5b855b333a667d5510ce4465",
            "type": "contract-invite",
            "attributes": {
                "email": "hanna+hfwkjdhvckdjv@elastic.io",
                "role": "guest"
            }
        }
    ],
    "meta": {}
}
```

This endpoints returns a list of pending members (invites) for certain Contract.


### HTTP Request

`GET https://api.elastic.io/v2/contracts/CONTRACT_ID/invites/`

#### Authorization

Client has to be a member of the Contract.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract











## Invite a user to Contract

> Example Request:

```shell
curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/invites/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
   {
       "data": {
           "type": "contract-invite",
           "attributes": {
               "email": "admin@elastic.io",
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
    "id":"5b880f7bf3c1a440112a3bb6",
    "type":"contract-invite",
    "attributes":{
      "email":"admin@elastic.io",
      "role":"admin"
    }
  },
  "meta":{

  }
}
```

This endpoint allows to invite a user to Contract.


### HTTP Request

`POST https://api.elastic.io/v2/contracts/{CONTRACT_ID}/invites/`


#### Authorization
This request is authorized for Contract members with role `Admin` or `TenantAdmin`.


### URL Parameters
Parameter           | Description
------------------- | -----------
CONTRACT_ID         | The ID of the Contract


### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "contract-invite".
attributes.email | yes       | Email.
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns

Returns invite object if the call succeeded











## Add a new member to Contract

> Example Request:

```shell
curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "contract-member",
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
    "type":"contract-member",
    "id":"588f832b87d7c33c7d5cc37a",
    "attributes":{
      "first_name":"Santos",
      "last_name":"Mitchell",
      "email":"Santos_Mitchell@example.com",
      "role":"admin"
    }
  }
}

```

This endpoint allows adding a user to a certain Contract as a member. 
No invitation email will be sent. The user becomes a member immediately. 


### HTTP Request

`POST https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members`


#### Authorization
This request is authorized for a user with `TenantAdmin` role only. Contact support team to get this role.

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id               | yes       | id of an already registered user, who will be added as a member of the Contract
type             | yes       | A value should be "contract-member".
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns

Returns member object if the call succeeded









## Update membership in Contract

> Example Request:

```shell
curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/ \
    -X PATCH  \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
    {
       "data": {
           "type": "contract-member",
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
    "type":"contract-member",
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
`PATCH https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for Contract members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID  | The ID of the Contract
USER_ID          | The ID of the user to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "contract-member".
id               | yes       | id of an already registered user, must match URL param {USER_ID}
attributes.role  | yes       | Available roles are: admin, integrator and guest.


###Returns

Returns member object if the call succeeded








## Remove member from Contract

> Example Request:

```shell
 curl https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/ \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```shell
HTTP/1.1 204 No Content
```

Remove a membership of the User in the Contract.
Ownership of those user's associated data will be transferred to admin User performing this operation:

* developers teams membership ???


### HTTP Request
`DELETE https://api.elastic.io/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for contract members with role `Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID  | The ID of the contract
USER_ID          | The ID of the user, which should leave the contract


###Returns

Responds with `204 No content` if the call succeeded (with empty body). 







## Delete Contract

> Example Request:

```shell
 curl -i https://api.elastic.io/v2/contracts/{CONTRACT_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint will delete a Contract along with the following items that were inside the Contract:

* Accounts (Credentials)
* Agents
* DataSamples
* InviteTokens
* Flow's DynamicMetadata
* Flow's DynamicSelectModel
* Flow's ExecStat
* Flow's ExecutionResult
* Flow's MarathonEvent
* Flow's RequestBin
* Flow's TaskHooksData
* Flow's TaskStatError
* Flow's TaskVersion
* Workspaces
* Teams
* Repos
* RepoBuilds
* User accounts who were only the members of the deleted Contract (and ssh keys associated with him/her).


*Note, that process of deletion is asynchronous. Actual deletion of all data will be performed after API response, because it will take some time to terminate all containers of Contract's flows. *
*A Contract cannot be deleted if any of its Components are used in another Contract's Flow*

### HTTP Request
`DELETE https://api.elastic.io/v2/contracts/{CONTRACT_ID} \`

#### Authorization
This request is authorized for members with role `Tenant Admin`.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID      | The ID of the Contract


### Returns

Responds with `204 No content` if the call succeeded (with empty body).

## Create a Workspace

> Example Request:

```shell
 curl https://api.elastic.io/v2/workspaces \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
       {
           "data": {         
               "type": "workspace",
               "attributes": {
                   "name": "My first Workspace"
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
      "name":"My first Workspace from API"
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
  "meta":{

  }
}

```

This endpoint allows to create a Workspace.


### HTTP Request

`POST https://api.elastic.io/v2/workspaces`


#### Authorization

This request is authorized to all user's roles.

Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "workspace"
attributes.name | yes      | Name of the Workspace


### Returns

Returns Workspace object if the call succeeded


