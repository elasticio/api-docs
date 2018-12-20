# Contracts

## What is a Contract unit?

A Contract is a fundamental entity (scope) that reflects an agreement between a customer and the platform's provider. The Contract scope can have an unlimited number of members, workspaces and development teams. It also serves as a singular entity for the billing department against the consumed resources by all the integration flows.

Every member of the Contract's scope has a specific access level or role within the current Contract. These roles are the `Contract Admin` and the `Member`. The same user can have different roles in different Contracts within the Platform.

*Please note that the Tenant Admin can create a Contracts unit/scope and the first Contract Admin. Once it is done the Contract Admin can invite the other members and establish their access level (grant access permissions). (Tenant is a higher scope in the Platform's hierarchy. It includes all the Contracts that belong to the white-label client).*

The table below lists the access roles against the performed API requests: 


Request / Role                                      | Tenant Admin  | Contract Admin      | Member
----------                                          | :-----------: | :---------------: | :----------:
Create a contract                                   |X              |-                  |-              |
Get contract by Id                                  |X              |X                  |X              |
Get contracts                                       |-              |X                  |X              |
Get a list of members of contract                   |-              |X                  |X              |
Get a list of pending members (invites) of contract |-              |X                  |X              |
Invite a user to contract                           |X              |X                  |-              |
Add a new member to contract                        |X              |-                  |-              |
Update membership in contract                       |-              |X                  |-              |
Remove a member from contract                       |X              |X                  |-              |
Delete contract                                     |X              |-                  |-              |

## Create a Contract

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts \
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

This endpoint allows creating a Contract.


### HTTP Request

`POST {{ api_base_url }}/v2/contracts`


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
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}?include=members,invites \
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
  "meta":{},
  "included":[
    {
      "id":"59d22e7eebrr5b0018adc248",
      "type":"contract-member",
      "attributes":{
        "first_name":"Alla",
        "last_name":"Ospik",
        "role":"admin",
        "email":"alla.ospik@{{ product_name }}"
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
        "email":"henry@{{ product_name }}"
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

This endpoint returns a Contract object for a specific contract's id.


### HTTP Request

`GET {{ api_base_url }}/v2/contracts/CONTRACT_ID/`

#### Authorization

A client has to be a member of the Contract's scope or belong to the `Tenant Admin` users group (please contact our support department to get this specific role).


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract


### URL Query Parameters
Parameter   | Required | Description              
----------- | -------- | ------------------------ 
include     | no       | You may add a parameter, such as the 'include' for more detailed information regarding the Workspace's entities. Possible values are `members` and/or `invites`.



## Get Contracts

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/
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
  "meta":{}
}
```

This endpoint returns all the Contract's objects for a specific user.


### HTTP Request

`GET {{ api_base_url }}/v2/contracts/`

#### Authorization

A client has to be a member of the Contract's scope.



## Get a list of members of the Contract's scope

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/ \
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
        "email":"hanna.yutsenko@{{ product_name }}"
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
        "email":"margarita@{{ product_name }}"
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
  "meta":{},
  "links":{
    "self":"/v2/contracts/5b4f3e093a47244006c71d47/members"
  }
}

```

This endpoint returns a list of all members of a specific Contract's scope.


### HTTP Request

`GET {{ api_base_url }}/v2/contracts/CONTRACT_ID/members/`

#### Authorization

A client has to be a member of the Contract's scope.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract






## Get a list of pending members (invites) of the Contract's scope

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/invites/ \
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
                "email": "hanna+jflcc53gflsbjfbj@{{ product_name }}",
                "role": "admin"
            }
        },
        {
            "id": "5b83c0462e7785501158b654",
            "type": "contract-invite",
            "attributes": {
                "email": "hanna+2708test1@{{ product_name }}",
                "role": "member"
            }
        },
        {
            "id": "5b855b333a667d5510ce4465",
            "type": "contract-invite",
            "attributes": {
                "email": "hanna+hfwkjdhvckdjv@{{ product_name }}",
                "role": "member"
            }
        }
    ],
    "meta": {}
}
```

This endpoint returns a list of pending members (invites) for a specific Contract's scope.


### HTTP Request

`GET {{ api_base_url }}/v2/contracts/CONTRACT_ID/invites/`

#### Authorization

A client has to be a member of the Contract's scope.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract



## Invite a user to the Contract's scope

> Example Request:

```shell
curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/invites/ \
    -X POST \
    -u {EMAIL}:{APIKEY} \
    -H 'Content-Type: application/json' -d '
   {
       "data": {
           "type": "contract-invite",
           "attributes": {
               "email": "admin@{{ product_name }}",
               "role": "admin",
               "workspace_id":"{WORKSPACE_ID}",
               "workspace_role":"integrator"
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
      "email":"admin@{{ product_name }}",
      "role":"admin"
    }
  },
  "meta":{}
}
```

This endpoint allows to invite a user to Contract.


### HTTP Request

`POST {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/invites/`


#### Authorization
This request is authorized for a Contract's scope members with the `Admin` or the `TenantAdmin` roles. To provide the workspase_id as an additional parameter user has to have Admin privileges and belong to the provided Workspace.


### URL Parameters
Parameter           | Description
------------------- | -----------
CONTRACT_ID         | The ID of the Contract


### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "contract-invite".
attributes.email | yes       | Email.
attributes.role  | yes       | Available roles are admin and member.
attributes.workspace_id | no | The id of the corresponding Workspace.
attributes.workspace_role  | no | Available roles are Admin, Integrator, and Guest.


### Returns

Returns invite the object if the call succeeded











## Add a new member to the Contract's scope

> Example Request:

```shell
curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/ \
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
No invitation email message will be sent. The user becomes a member immediately. 


### HTTP Request

`POST {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members`


#### Authorization
This request is authorized for a user with the `Tenant Admin` role only. Please contact our support department to get this role.

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
id               | yes       | id of an already registered user; the user will be added to the Contract's scope as a member.
type             | yes       | A value should be "contract-member".
attributes.role  | yes       | Available roles are Admin and Member.


###Returns

Returns Member's object if the call succeeded









## Update membership in the Contract's scope

> Example Request:

```shell
curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/ \
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
      "role":"member"
    }
  },
  "meta":{}
}

```

This endpoint allows updating a membership of a given user. Only `role` attribute can be updated. 


### HTTP Request
`PATCH {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the Contract's members with the `Admin` role.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID  | The ID of the Contract
USER_ID          | The ID of the user to be updated

### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be the "contract-member".
id               | yes       | id of an already registered user, must match the {USER_ID} URL param
attributes.role  | yes       | Available roles are admin and member.


###Returns

Returns the member's object if the call succeeded








## Remove a member from the Contract's scope.

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/ \
    -X DELETE    \
    -u {EMAIL}:{APIKEY}
```


> Example Response:

```shell
HTTP/1.1 204 No Content
```

Removes User's membership in the Contract's scope.
User's ownership associated data will be transferred to the admin User by performing the following pattern:

* developers teams membership


### HTTP Request
`DELETE {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the contract's scope members with the `Admin` and `Tenant Admin` roles.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID  | The ID of the contract scope
USER_ID          | The ID of the user that should leave the contract's scope


###Returns

Responds with `204 No content` message if the call succeeded (with empty body). 







## Delete Contract

> Example Request:

```shell
 curl -i {{ api_base_url }}/v2/contracts/{CONTRACT_ID} \
  -X DELETE \
  -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 204 No Content
```

The endpoint deletes a Contract's scope along with everything it includes. These items are listed below:

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
* User accounts who were only the members of the deleted Contract's scope, as well as ssh keys associated with him/her.


*Note, the deletion process is asynchronous. The actual data deletion will be performed after an API response, as it requires time for termination of all the Contract's flows containers. *
*A Contract cannot be deleted in case any of its Components are being used in another Contract's Flow*

### HTTP Request
`DELETE {{ api_base_url }}/v2/contracts/{CONTRACT_ID} \`

#### Authorization
This request is authorized for members with the `Tenant Admin` role.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID      | The ID of the Contract


### Returns

Responds with `204 No content` message if the call succeeded (with empty body).

