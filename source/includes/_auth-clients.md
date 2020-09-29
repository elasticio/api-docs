# Auth Clients (Experimental)

 <aside class="warning">
 <b>The Auth Clients section is an experimental API</b>
 </aside>

 
In order to use an OAuth2 based Component in the platform it is required to register a client at the authorization 
server. Upon registration the authorization server issues the registered client an identifier (client ID) and a secret.
These client credentials are used to create a client using the following API.
Auth clients can be created on any level: tenant, contract or workspace which incapsulate each other (in order), i.e 
client created on tenant level is available to use for creating secrets in any workspace of the tenant.

## Retrieve All Auth Clients


> Example Request:


```shell
curl {{ api_base_url }}/v2/auth-clients \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "{AUTH-CLIENT_ID}",
      "type": "auth-client",
      "attributes": {
        "type": "oauth2",
        "name": "Auth client",
        "credentials": {
          "client_id": "{CLIENT_ID}",
          "client_secret": "{CLIENT_SECRET}",
          "refresh_token_uri": "http://example.com",
          "token_expires_in": 18000,
          "token_uri": "{TOKEN_URI}",
          "auth_uri": "{AUTH_URI}"
        }
      },
      "relationships": {
        "components": {
          "data": [
            {
              "id": "{COMPONENT_ID}",
              "type": "component"
            }
          ]
        },
        "workspace": {
          "data": {
            "id": "{WORKSPACE_ID}",
            "type": "workspace"
          },
          "links": {
            "self": "/v2/workspace/{WORKSPACE_ID}"
          }
        }
      },
      "links": {
        "self": "/v2/auth-clients/{AUTH-CLIENT_ID}"
      }
    }
  ],
  "meta": {}
}
```

This resource allows you to retrieve Auth-clients.

### HTTP Request

`GET {{ api_base_url }}/v2/auth-clients`

#### Authorization

This request is authorized with one of the `global.auth_clients.get`, `tenants.auth_clients.get`, `contracts.auth_clients.get` or `workspaces.auth_clients.get`. Each permission allows to list Auth Clients in particular scope inclusively: `global.auth_clients.get` allows to list global clients, `tenants.auth_clients.get` allows to list global and tenant's clients, `contracts.auth_clients.get` allows to list global, tenant's and all tenant's contracts clients, `workspaces.auth_clients.get` allows to list all global, tenant's, contracts' and workspaces' clients.

`auth_clients.get` permissions are also used to authorize access to Auth Client's `credentials` field: one can see Auth Client's `credential` only if client's scope and permission's scope match, i.e. `credentials` of tenant's Auth Client are visible for users only with `tenants.auth_clients.get` permissions, though tenant Auth Client itself is visible for users with `workspaces.auth_clients.get`.

### Query Parameters

| Parameter         | Required              | Description                                                                                                 |
| :---              | :---                  | :---                                                                                                        |
| filter[component] | no                    | Filter the Auth Clients only for specific component. Must be `id` of `Component`                            |
| workspace_id      | no<sup>*</sup>       | Show Auth Clients available in the given workpspace (including contract's, tenant's and global auth-clients).|
| contract_id       | no<sup>*</sup>       | Show Auth Clients available in the given contract (including tenant's and global auth-clients).              |
| tenant_id         | no<sup>*</sup>       | Show Auth Clients available in the given tenant and global scope.                                            |

<sup>*</sup> - only one of `workspace_id`, `contract_id`, `tenant_id` can be specified at time. If none these of parameters is specified only global clients will be returned.

### Returns

Returns list of the Auth-clients.

## Create Auth Client


> Example Request:


```shell
curl {{ api_base_url }}/v2/auth-clients \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
   "data":{
      "type":"auth-client",
      "attributes":{
         "type":"oauth2",
         "name":"Auth client",
         "credentials":{
            "client_id":"{CLIENT_ID}",
            "client_secret":"{CLIENT_SECRET}",
            "refresh_token_uri":"http://example.com",
            "token_expires_in":18000,
            "token_uri":"{TOKEN_URI}",
            "auth_uri":"{AUTH_URI}"
         }
      },
      "relationships":{
         "components":{
            "data":[
               {
                  "id":"{COMPONENT_ID}",
                  "type":"component"
               }
            ]
         },
         "workspace":{
            "data":{
               "id":"{WORKSPACE_ID}",
               "type":"workspace"
            }
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
  "data": {
    "id": "{AUTH-CLIENT_ID}",
    "type": "auth-client",
    "attributes": {
      "type": "oauth2",
      "name": "Auth client",
      "credentials": {
        "client_id": "{CLIENT_ID}",
        "client_secret": "{CLIENT_SECRET}",
        "refresh_token_uri": "http://example.com",
        "token_expires_in": 18000,
        "token_uri": "{TOKEN_URI}",
        "auth_uri": "{AUTH_URI}"
      }
    },
    "relationships": {
      "components": {
        "data": [
          {
            "id": "{COMPONENT_ID}",
            "type": "component"
          }
        ]
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/auth-clients/{AUTH-CLIENT_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to create an Auth-client. Scope where client is created is controlled by corresponding relationship: `workspace`, `contract` or `tenant`. No relationship means that auth-client will be created in the global scope.

### HTTP Request

`POST {{ api_base_url }}/v2/auth-clients`

#### Authorization

This request is authorized for the global scope with the `global.auth_clients.create` permission, for the tenant's scope members with the `tenants.auth_clients.create` permission, for the contract's scope members with the `contracts.auth_clients.create`, for the workspace's scope members with the `workspaces.auth_clients.create`.


### Body Parameters

| Parameter                                      | Required                                   | Description |
| :---                                           | :---                                       | :---        |
| type                                           | yes                                        | Allowed value: ``auth-client`` |
| attributes.name                                | yes                                        | Auth Client name                |
| attributes.type                                | yes                                        | Auth Client type. May be any of: ``oauth2``and other types (noauth, basic,api_key)|
| attributes.credentials                         | yes (if ``attributes.type`` is ``oauth2``) | Auth Client credentials |
| attributes.credentials.client_id               | yes (if ``attributes.type`` is ``oauth2``) | Auth Client client ID |
| attributes.credentials.client_secret           | yes (if ``attributes.type`` is ``oauth2``) | Auth Client client secret |
| attributes.credentials.refresh_token_uri       | yes (if ``attributes.type`` is ``oauth2``) | Auth Client refresh token URI |
| attributes.credentials.token_expires_in        | no                                         | The value that will be set as `expires_in` in Auth Secret linked to the Auth Client after Auth Secret refresh. |
| attributes.credentials.token_uri               | yes (if ``attributes.type`` is ``oauth2``) | Auth Client token URI |
| attributes.credentials.auth_uri                | yes (if ``attributes.type`` is ``oauth2``) | Auth Client auth URI|
| relationships.components.data[].component.type | yes                                        | Allowed value: ``component`` |
| relationships.components.data[].component.id   | yes                                        | Component ID |
| relationships.tenant.data.type                 | no                                         | Allowed value: ``tenant`` |
| relationships.tenant.data.id                   | no                                         | Tenant ID |
| relationships.contract.data.type               | no                                         | Allowed value: ``contract`` |
| relationships.contract.data.id                 | no                                         | Contract ID |
| relationships.workspace.data.type              | no                                         | Allowed value: ``workspace`` |
| relationships.workspace.data.id                | no                                         | Workspace ID |

### Returns

Returns the created Auth Client object.


## Retrieve the Auth Client by ID

> Example Request:


```shell
curl {{ api_base_url }}/v2/auth-clients/{AUTH-CLIENT_ID}?workspace_id={WORKSPACE_ID} \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
  "data": {
    "id": "{AUTH-CLIENT_ID}",
    "type": "auth-client",
    "attributes": {
      "type": "oauth2",
      "name": "Auth client",
      "credentials": {
        "client_id": "{CLIENT_ID}",
        "client_secret": "{CLIENT_SECRET}",
        "refresh_token_uri": "http://example.com",
        "token_expires_in": 18000,
        "token_uri": "{TOKEN_URI}",
        "auth_uri": "{AUTH_URI}"
      }
    },
    "relationships": {
      "components": {
        "data": [
          {
            "id": "{COMPONENT_ID}",
            "type": "component"
          }
        ]
      },
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspaces/{WORKSPACE_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/auth-clients/{AUTH-CLIENT_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to retrieve an Auth Client by its ID.

### HTTP Request

`GET {{ api_base_url }}/v2/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized with one of the `global.auth_clients.get`, `tenants.auth_clients.get`, `contracts.auth_clients.get` or `workspaces.auth_clients.get`. Each permission allows to get Auth Client in particular scope inclusively: `global.auth_clients.get` allows to get global client, `tenants.auth_clients.get` allows to get global and tenant's client, `contracts.auth_clients.get` allows to get global, tenant's and all tenant's contracts clients, `workspaces.auth_clients.get` allows to get global, tenant's, contracts' and workspaces' clients.

`auth_clients.get` permissions are also used to authorize access to Auth Client's `credentials` field: one can see Auth Client's `credential` only if client's scope and permission's scope match, i.e. `credentials` of tenant's Auth Client are visible for users only with `tenants.auth_clients.get` permissions, though tenant Auth Client itself is visible for users with `workspaces.auth_clients.get`.

To specify scope of request one of `workspace_id`, `contract_id` or `tenant_id` query parameters is used. For example, tenant auth client can be retreived by id if user has `workspaces.auth_clients.get` permission in one of the tenant's workspaces, so to specify those workspace `workspace_id` query parameter is used, without scope parameter you can get only global client. In case if the user tries to get not a global client and doesn't specify the query parameter - such request  will be rejected, as permission can't be checked.

### URL Parameters

| Parameter      | Required | Description            |
| :---           | :---     | :---                   |
| AUTH-CLIENT_ID | yes      | Auth Client ID         |

### Query Parameters

| Parameter         | Required  | Description                                                                                          |
| :---              | :---      | :---                                                                                                 |
| workspace_id      | no        | Show auth-client available in the given workspace (including global, tenant's and contract's auth-clients). |
| contract_id       | no        | Show auth-client available in the given contract (including global and tenant's auth-clients).                  |
| tenant_id         | no        | Show auth-client available in the given tenant and global scopes.                  |

### Returns

The Auth Client with given ID


## Update the Auth Client


> Example Request:


```shell
curl {{ api_base_url }}/v2/auth-clients/{AUTH-CLIENT_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
   {
    "data":{
      "id":"{AUTH-CLIENT_ID}",
      "type":"auth-client",
      "attributes":{
        "name":"Auth client",
        "credentials":{
          "client_secret": "{CLIENT_SECRET}",
          "token_expires_in": 18000
        }
      },
      "relationships":{
        "components":{
          "data":[
            {
              "id":"{COMPONENT_ID}",
              "type":"component"
            }
          ]
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
      "id":"{AUTH-CLIENT_ID}",
      "type":"auth-client",
      "attributes":{
         "type":"oauth2",
         "name":"Auth client",
         "credentials":{
           "client_id": "{CLIENT_ID}",
           "client_secret": "{CLIENT_SECRET}",
           "refresh_token_uri": "http://example.com",
           "token_expires_in": 18000,
           "token_uri": "{TOKEN_URI}",
           "auth_uri": "{AUTH_URI}"
         }
      },
      "relationships":{
        "components": {
          "data": [
            {
              "id": "{COMPONENT_ID}",
              "type": "component"
            }
          ]
        },
         "tenant":{
            "data":{
               "id":"{TENANT_ID}",
               "type":"tenant"
            },
            "links":{
               "self":"/v2/tenants/{TENANT_ID}"
            }
         }
      },
     "links":{
       "self":"/v2/auth-clients/{AUTH-CLIENT_ID}"
     }
   },
   "meta":{}
}
```

This resource allows you to update the Auth Client. If the Auth Client with type ``oauth2`` then you can update 
name, `token_expires_in` and linked components, otherwise if the type is ``other``, then you can put in credentials any data that you want
and add components which can use this Auth Client.

### HTTP Request

`PATCH {{ api_base_url }}/v2/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for members with appropriate permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| AUTH-CLIENT_ID    | yes       | Auth Client ID |


### Body Parameters
| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | Allowed value: ``auth-client`` |
| attributes.name                          | no       | New name of the Auth Client     |
| attributes.credentials.client_secret     | no       | Auth Client client secret     |
| attributes.credentials.token_expires_in  | no       | The value that will be set as `expires_in` in Auth Secret linked to the Auth Client after Auth Secret refresh|
| relationships.components.data[].component.type | no | Allowed value: ``component`` |
| relationships.components.data[].component.id | no | Component ID |

### Returns

Returns the updated Auth Client object.


## Delete Auth Client

> Example Request:

```shell
curl {{ api_base_url }}/v2/auth-clients/{AUTH-CLIENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete an Auth Client. You can't delete an Auth Client, while it has one or more secrets 
attached.

### HTTP Request

``DELETE {{ api_base_url }/v2/auth-clients/{AUTH-CLIENT_ID}``

#### Authorization

This request is authorized for members with appropriate permission.

### URL Parameters

| Parameter      | Required | Description         |
| :--------      | :------- | :----------         |
| AUTH-CLIENT_ID | yes      | Auth Client ID      |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
