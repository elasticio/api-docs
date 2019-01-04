# Contracts

## What is a Contract unit?

A Contract is a fundamental entity (scope) that reflects an agreement between a customer and the platform's provider. The Contract scope can have an unlimited number of members, workspaces, and development teams. It also serves as a singular entity for the billing department against the consumed resources by all the integration flows.
Every member of the Contract's scope has a specific access level or role within the current Contract. To get all available roles, please execute the "Get the Contract's roles" endpoint. The same user can have different roles in different Contracts within the Platform. 
Every Contract must have at least one Owner. The Owner’s Role has a predefined/default permissions’ set. It means this role cannot be deleted and the permissions’ set cannot be changed.

*Please note that the Tenant Admin creates a Contract along with the Contract’s Owner. Once it’s done the Contract’s Owner will be able to invite other Users as well as assigning the necessary roles for them. (Tenant is a higher scope in the Platform's hierarchy. It includes all the Contracts that belong to the white-label client).*

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
      "name":"LucontractOne",
      "status": "active"
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
        "roles":[
          "admin"
        ],
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
        "roles":[
          "admin"
        ],
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
        "name":"LuzhaOrg",
        "status": "active"
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
        "name":"FridayContract",
        "status": "active"
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
        "roles":[
          "admin"
        ],
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
        "roles":[
          "admin"
        ],
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
                "email": "admin@{{ product_name }}",
                "roles": [
                  "admin"
                ]
            }
        },
        {
            "id": "5b83c0462e7785501158b654",
            "type": "contract-invite",
            "attributes": {
                "email": "member@{{ product_name }}",
                "roles": [
                  "member"
                ]
            }
        },
        {
            "id": "5b855b333a667d5510ce4465",
            "type": "contract-invite",
            "attributes": {
                "email": "member@{{ product_name }}",
                "roles": [
                  "member"
                ]
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


## Get the Contract's roles

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/roles/ \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"{CONTRACT-POLICY_ID}",
    "type":"contract-policy",
    "attributes":{
      "roles":[
        {
          "i18n":{
            "en":"Admin"
          },
          "role":"admin",
          "permissions":[
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete",
            "contracts.repository.edit",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Member"
          },
          "role":"member",
          "permissions":[
            "contracts.workspace.create"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Admin"
          },
          "role":"admin",
          "permissions":[
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Integrator"
          },
          "role":"integrator",
          "permissions":[
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Guest"
          },
          "role":"guest",
          "permissions":[],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Custom_role"
          },
          "role":"custom_role",
          "permissions":[
            "workspaces.flow.edit",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        },
        {
          "i18n":{
            "en":"Custom_role"
          },
          "role":"custom_role",
          "permissions":[
            "contracts.workspace.create",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "contracts.membership.edit",
            "contracts.workspace.create",
            "contracts.workspace.listAll",
            "contracts.workspace.delete",
            "contracts.repository.edit",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"Owner"
          },
          "role":"owner",
          "permissions":[
            "workspaces.workspace.edit",
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime",
            "workspaces.credential.edit"
          ],
          "scope":"workspaces"
        }
      ]
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
      }
    }
  },
  "meta":{

  }
}
```

This endpoint returns a list of the contract roles for a specific Contract's scope.


### HTTP Request

`GET {{ api_base_url }}/v2/contracts/CONTRACT_ID/roles/`

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
               "roles": [
                 "admin"
               ],
               "workspace_id":"{WORKSPACE_ID}",
               "workspace_roles":[
                 "integrator"
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
    "id":"5c20bd0376b463001053a6b5",
    "type":"contract-invite",
    "attributes":{
      "email":"admin@{{ product_name }}",
      "roles":[
        "admin"
      ],
      "workspace_id":"{WORKSPACE_ID}",
      "workspace_roles":[
        "integrator"
      ]
    }
  },
  "meta":{}
}
```

This endpoint allows inviting a user to Contract.


### HTTP Request

`POST {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/invites/`


#### Authorization
This request is authorized for a Contract's scope members with the permission `contracts.membership.edit` or the `TenantAdmin` role. To provide the `workspase_id` as an additional parameter user has to have permission `workspaces.workspace.edit` and belong to the provided Workspace.


### URL Parameters
Parameter           | Description
------------------- | -----------
CONTRACT_ID         | The ID of the Contract


### Payload Parameters
Parameter        | Required  | Description
---------        | --------- | -----------
type             | yes       | A value should be "contract-invite".
attributes.email | yes       | Email.
attributes.roles[]  | yes       | To get all available roles, please execute the "Get the Contract's roles" endpoint.
attributes.workspace_id | no | The id of the corresponding Workspace.
attributes.workspace_roles[]  | no | To get all available roles, please execute the "Get the Contract's roles" endpoint.


### Returns

Returns would invite the object if the call succeeded











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
    "type":"contract-member",
    "id":"588f832b87d7c33c7d5cc37a",
    "attributes":{
      "first_name":"Santos",
      "last_name":"Mitchell",
      "email":"Santos_Mitchell@example.com",
      "roles": [
        "{ROLE_1}",
        "{ROLE_2}"
      ]
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
attributes.roles[]   | yes       | To get all available roles, please execute the "Get the Contract's roles" endpoint.


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
    "type":"contract-member",
    "links":{
      "self":"/v2/members/59f747c33f1d3c001901a44e"
    },
    "attributes":{
      "roles":[
        "member"
      ]
    }
  },
  "meta":{}
}

```

This endpoint allows updating membership of a given user. Only `roles` attribute can be updated. 


### HTTP Request
`PATCH {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the Contract's members with the `contracts.membership.edit` permission.

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
attributes.roles[]  | yes       | To get all available roles, please execute the "Get the Contract's roles" endpoint.


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

```http
HTTP/1.1 204 No Content
```

Removing User's membership in the Contract's scope.



### HTTP Request
`DELETE {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/members/{USER_ID}/`

#### Authorization
This request is authorized for the contract's scope members with the `contracts.membership.edit` permission and `Tenant Admin` role.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID  | The ID of the contract scope
USER_ID          | The ID of the user that should leave the contract's scope


###Returns

Responds with `204 No content` message if the call succeeded (with empty body). 


## Suspend Contract

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/suspend \
 -X POST \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 202 Accepted
```

This endpoint allows suspending the Contract. The process is asynchronous. Suspending is completed once all of the flows in a given Contract will be stopped. While the Contract gets suspended, all the writing requests will be rejected.

### HTTP Request

`POST {{ api_base_url }}/v2/contracts/CONTRACT_ID/suspend/`

#### Authorization

The client has to have the privileges of the `Service Account` record type.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract



## Unsuspend Contract

> Example Request:

```shell
 curl {{ api_base_url }}/v2/contracts/{CONTRACT_ID}/unsuspend \
 -X POST \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
```

This endpoint allows you to unsuspend the Contract.

### HTTP Request

`POST {{ api_base_url }}/v2/contracts/CONTRACT_ID/unsuspend/`

#### Authorization

The client has to have the privileges of the `Service Account` record type.


### URL Parameters
Parameter       | Description
--------------- | -----------
CONTRACT_ID | The ID of the Contract




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
*A Contract cannot be deleted while any of its Components are being used in another Contract Flow*

### HTTP Request
`DELETE {{ api_base_url }}/v2/contracts/{CONTRACT_ID} \`

#### Authorization
This request is authorized for members with the `Tenant Admin` role.

### URL Parameters
Parameter        | Description
---------------- | -----------
CONTRACT_ID      | The ID of the Contract


### Returns

Responds with the `204 No content` message if the call succeeded (with empty body).

