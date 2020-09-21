# Auth Secrets (Experimental)

 <aside class="warning">
 <b>The Auth Secrets section is an experimental API</b>
 </aside>

The Secret is used to expose the information that the platform needs to collect from the integrator in order to be able to connect to their instance/account. The information collected typically includes:

- URL to the integrator’s instance
- Username or other account ID
- Password or other API keys/tokens required to authenticate

Check [Create a flow](#create-a-flow) section on how to use a secret in your flow.


## Retrieve All Auth Secrets


> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets \
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
         "id":"{AUTH-SECRET_ID}",
         "type":"auth-secret",
         "attributes":{
            "name":"Auth secret",
            "state":"ready",
            "credentials":{
              "access_token": "{ACCESS_TOKEN}",
              "refresh_token": "{REFRESH_TOKEN}",
              "expires_in": "{EXPIRES_IN}"
            }
         },
         "relationships":{
            "workspace":{
               "data":{
                  "id":"{WORKSPACE_ID}",
                  "type":"workspace"
               },
               "links":{
                  "self":"/v2/workspace/{WORKSPACE_ID}"
               }
            },
            "user":{
               "data":{
                  "id":"{USER_ID}",
                  "type":"user"
               },
               "links":{
                  "self":"/v2/users/{USER_ID}"
               }
            },
            "auth-client":{
               "data":{
                  "id":"{AUTH-CLIENT_ID}",
                  "type":"auth-client"
               },
               "links":{
                  "self":"/v2/tenantns/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
               }
            }
         },
        "links":{
          "self":"/v2/workspace/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}"
        }
      }
   ],
   "meta":{}
}
```

This resource allows you to retrieve all the Auth Secrets belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets`

#### Authorization

This request is authorized for the Workspace's scope members with the `workspaces.auth_secret.get` permission.

### URL Parameters

| Parameter         | Required  | Description           |
| :---              | :---      | :---                  |
| WORKSPACE_ID      | yes       | Workspace ID|

### Query Parameters

| Parameter          | Required  | Description |
| :---               | :---      | :---        |
| filter[user]       | no        | Filter the Auth Secrets only for specific User. Must be `id` of `User`           |
| filter[auth_client]| no        | Filter the Auth Secrets only for specific Auth-client. Must be `id` of `Auth-client`    |


### Returns

Returns all the Auth Secrets belonging to the given Workspace.


## Create Auth Secret


> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
     "data":{
       "type":"auth-secret",
       "attributes":{
          "name":"Auth secret",
          "state":"ready",
          "credentials":{
            "access_token": "{ACCESS_TOKEN}",
            "refresh_token": "{REFRESH_TOKEN}",
            "expires_in": "{EXPIRES_IN}",
            "additional_params": "{ADDITIONAL_PARAMS}"
          }
       },
       "relationships":{
          "auth-client":{
             "data":{
                "id":"{AUTH-CLIENT_ID}",
                "type":"auth-client"
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
     "id":"{AUTH-SECRET_ID}",
     "type":"auth-secret",
     "attributes":{
        "name":"Auth secret",
        "state":"ready",
        "credentials":{
          "access_token": "{ACCESS_TOKEN}",
          "refresh_token": "{REFRESH_TOKEN}",
          "expires_in": "{EXPIRES_IN}",
          "additional_params": "{ADDITIONAL_PARAMS}"
        }
     },
     "relationships":{
        "workspace":{
           "data":{
              "id":"{WORKSPACE_ID}",
              "type":"workspace"
           },
           "links":{
              "self":"/v2/workspace/{WORKSPACE_ID}"
           }
        },
        "user":{
           "data":{
              "id":"{USER_ID}",
              "type":"user"
           },
           "links":{
              "self":"/v2/users/{USER_ID}"
           }
        },
        "auth-client":{
           "data":{
              "id":"{AUTH-CLIENT_ID}",
              "type":"auth-client"
           },
           "links":{
              "self":"/v2/tenantns/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
           }
        }
     },
    "links":{
      "self":"/v2/workspace/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}"
    }
  },
   "meta":{}
}
```

This resource allows you to create an Auth Secret. If related Auth Client has type ``oauth2`` then ``credentials``
object must contain only properties ``access_token``, ``refresh_token`` and ``expires_in``, otherwise if the type is
``other``, then you can put in credentials any data that you want.

### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets`

#### Authorization

This request is authorized for the Workspace's scope members with the `workspaces.auth_secret.create` permission.

### URL Parameters

| Parameter         | Required  | Description           |
| :---              | :---      | :---                  |
| WORKSPACE_ID      | yes       | Workspace ID|


### Body Parameters

| Parameter                                | Required | Description |
| :---                                     | :---     | :---        |
| type                                     | yes      | Allowed value: ``auth-secret`` |
| attributes.name                          | yes      | Auth Secret name                |
| attributes.state                         | yes      | Auth Secret type. May be any of: ``ready``, ``error``|
| attributes.error                         | no       | Auth Secret error |
| attributes.credentials                   | yes      | Auth Secret credentials |
| attributes.credentials.access_token      | yes (if ``auth-client`` is ``oauth2``) | Auth Secret access token |
| attributes.credentials.refresh_token     | yes (if ``auth-client`` is ``oauth2``) | Auth Secret refresh token |
| attributes.credentials.expires_in        | yes (if ``auth-client`` is ``oauth2``) | Auth Secret expires in |
| attributes.credentials.additional_params | no (if ``auth-client`` is ``oauth2``) | Auth Secret additional parameters |
| relationships.auth_client.data.type      | yes       | Allowed value: ``auth-client``  |
| relationships.auth_client.data.id        | yes       | Auth Client ID |

### Returns

Returns the created Auth Secret object.

## Refresh the Auth Secret


> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}/refresh \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": [
    {
      "id": "{AUTH-SECRET_ID}",
      "type": "auth-secret",
      "attributes": {
        "name": "Auth secret",
        "state": "ready",
        "credentials": {
          "access_token": "{ACCESS_TOKEN}",
          "refresh_token": "{REFRESH_TOKEN}",
          "expires_in": "{EXPIRES_IN}"
        }
      },
      "relationships": {
        "workspace": {
          "data": {
            "id": "{WORKSPACE_ID}",
            "type": "workspace"
          },
          "links": {
            "self": "/v2/workspace/{WORKSPACE_ID}"
          }
        },
        "user": {
          "data": {
            "id": "{USER_ID}",
            "type": "user"
          },
          "links": {
            "self": "/v2/users/{USER_ID}"
          }
        },
        "auth-client": {
          "data": {
            "id": "{AUTH-CLIENT_ID}",
            "type": "auth-client"
          },
          "links": {
            "self": "/v2/tenantns/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
          }
        }
      },
      "links": {
        "self": "/v2/workspace/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}"
      }
    }
  ],
  "meta": {}
}
```

This resource allows you to manually refresh the Auth Secret if it supports this operation.

### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}/refresh`

#### Authorization

This request is authorized for the Workspace's scope members with the `workspaces.auth_secret.refresh` permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| WORKSPACE_ID      | yes       | Workspace ID |
| AUTH-SECRET_ID    | yes       | Auth Secret ID |

### Returns

Returns the Auth Secret object.


## Retrieve Auth Secret by ID

> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID} \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "id": "{AUTH-SECRET_ID}",
    "type": "auth-secret",
    "attributes": {
      "name": "Auth secret",
      "state": "error",
      "error": "Something went technical wrong",
      "credentials": {
        "access_token": "{ACCESS_TOKEN}",
        "refresh_token": "{REFRESH_TOKEN}",
        "expires_in": "{EXPIRES_IN}"
      }
    },
    "relationships": {
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspace/{WORKSPACE_ID}"
        }
      },
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "auth-client": {
        "data": {
          "id": "{AUTH-CLIENT_ID}",
          "type": "auth-client"
        },
        "links": {
          "self": "/v2/tenantns/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/workspace/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to retrieve the Auth-secret by its identifier. If the Auth-secret with given ID does not belong
to the current Workspace, an error will be returned.

### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}`

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.get` permission.

### URL Parameters

| Parameter      | Required | Description            |
| :---           | :---     | :---                   |
| WORKSPACE_ID   | yes      | Workspace ID   |
| AUTH-SECRET_ID | yes      | Auth Secret ID |


### Returns

Auth Secret with the given ID


## Update the Auth Secret


> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json' -d '
    {
      "data": {
        "id": "{AUTH-SECRET_ID}",
        "type": "auth-secret",
        "attributes": {
          "name": "Auth secret",
          "state": "error",
          "error": "Something went technical wrong",
          "credentials": {
            "access_token": "{ACCESS_TOKEN}",
            "refresh_token": "{REFRESH_TOKEN}",
            "expires_in": "{EXPIRES_IN}"
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
  "data": {
    "id": "{AUTH-SECRET_ID}",
    "type": "auth-secret",
    "attributes": {
      "name": "Auth secret",
      "state": "error",
      "error": "Something went technical wrong",
      "credentials": {
        "access_token": "{ACCESS_TOKEN}",
        "refresh_token": "{REFRESH_TOKEN}",
        "expires_in": "{EXPIRES_IN}"
      }
    },
    "relationships": {
      "workspace": {
        "data": {
          "id": "{WORKSPACE_ID}",
          "type": "workspace"
        },
        "links": {
          "self": "/v2/workspace/{WORKSPACE_ID}"
        }
      },
      "user": {
        "data": {
          "id": "{USER_ID}",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/{USER_ID}"
        }
      },
      "auth-client": {
        "data": {
          "id": "{AUTH-CLIENT_ID}",
          "type": "auth-client"
        },
        "links": {
          "self": "/v2/tenantns/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/workspace/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to update the Auth Secret. If related Auth-client has type ``oauth2`` then ``credentials``
object must contain only properties ``access_token``, ``refresh_token``, ``expires_in``, otherwise if the type
is ``other``, then you can put in credentials any data that you want.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the Workspace's scope members with the `workspaces.auth_secret.edit` permission.

### URL Parameters

| Parameter         | Required  | Description             |
| :---              | :---      | :---                    |
| WORKSPACE_ID      | yes       | Workspace ID |
| AUTH-SECRET_ID    | yes       | Auth Secret ID|


### Body Parameters

| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | Allowed value: ``auth-secret``  |
| attributes.name                          | no       | New name of the Auth Secret     |
| attributes.credentials                   | no       | Auth Secret credentials         |

### Returns

Returns the updated Auth-secret object.


## Delete Auth Secret

> Example Request:

```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete the Auth Secret.

### HTTP Request

``DELETE {{ api_base_url }/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}``

#### Authorization

This request is authorized for the Workspace's scope members with the `workspaces.auth_secret.delete` permission.

### URL Parameters

| Parameter      | Required | Description    |
| :--------      | :------- | :----------    |
| WORKSPACE_ID   | yes      | Workspace ID    |
| AUTH-SECRET_ID | yes      | Auth Secret ID |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
