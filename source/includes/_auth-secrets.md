# Secrets
 

## Retrieve all auth-secrets


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
              "access_token": '{ACCESS_TOKEN}',
              "refresh_token": '{REFRESH_TOKEN}',
              "expires_in": '1000000'
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

This resource allows you to retrieve all the Auth-secrets belonging to the given Workspace.

### HTTP Request

`GET {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets`

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.get` permission.

### URL Parameters

| Parameter         | Required  | Description           |
| :---              | :---      | :---                  |
| WORKSPACE_ID      | yes       | An Id of the Workspace|

### Query Parameters

| Parameter          | Required  | Description |
| :---               | :---      | :---        |
| filter[user]       | no        | Filter the Auth-secrets only for specific User. Must be `id` of `User`           |
| filter[auth_client]| no        | Filter the Auth-secrets only for specific Auth-client. Must be `id` of `Auth-client`    |


### Returns

Returns all the Auth-secrets belonging to the given Workspace.


## Create the auth secret


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
          "state":"error",
          "error":"Something went technical wrong",
          "credentials":{
            "access_token": '{ACCESS_TOKEN}',
            "refresh_token": '{REFRESH_TOKEN}',
            "expires_in": '1000000'
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
        "state":"error",
        "error":"Something went technical wrong",
        "credentials":{
          "access_token": '{ACCESS_TOKEN}',
          "refresh_token": '{REFRESH_TOKEN}',
          "expires_in": '1000000'
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

This resource allows you to create an Auth-secret. If related Auth-client has type ``oauth2`` then ``credentials`` 
object must contain only properties ``access_token``, ``refresh_token`` and ``expires_in``, otherwise if the type is 
``other`` than you can put in credentials any data that you want.

### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets`

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.create` permission.

### URL Parameters

| Parameter         | Required  | Description           |
| :---              | :---      | :---                  |
| WORKSPACE_ID      | yes       | An Id of the Workspace|


### Body Parameters

| Parameter                                | Required | Description |
| :---                                     | :---     | :---        |
| type                                     | yes      | A value must be ``auth-secret`` |
| attributes.name                          | yes      | Auth-secret name                |
| attributes.state                         | yes      | Auth-secret type. May be any of: ``ready``, ``error``|
| attributes.error                         | no       | Auth-secret error |
| attributes.credentials                   | yes      | Auth-secret credentials |
| attributes.credentials.access_token      | yes(if ``auth-client`` is ``oauth2``) | Auth-secret access token |
| attributes.credentials.refresh_token     | yes(if ``auth-client`` is ``oauth2``) | Auth-secret refresh token |
| attributes.credentials.expires_in        | yes(if ``auth-client`` is ``oauth2``) | Auth-secret expires in |
| relationships.auth_client.data.type      | yes       | A value must be ``auth-client``  |
| relationships.auth_client.data.id        | yes       | An Id of the Auth-client |

### Returns

Returns the created Auth-secret object.

## Refresh the auth secret


> Example Request:


```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}/refresh \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Content-Type: application/json'
```



> Example Response:

```http
HTTP/1.1 201 OK
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
          "access_token": '{ACCESS_TOKEN}',
          "refresh_token": '{REFRESH_TOKEN}',
          "expires_in": '1000000'
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

This resource allows you to manually refresh the Auth-secret if it supports this operation.

### HTTP Request

`POST {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}/refresh`

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.refresh` permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| WORKSPACE_ID      | yes       | An Id of the Workspace |
| AUTH-SECRET_ID    | yes       | Auth-secret identifier |

### Returns

Returns the Auth-secret object.


## Retrieve the Auth-secret by ID

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
        "access_token": '{ACCESS_TOKEN}',
        "refresh_token": '{REFRESH_TOKEN}',
        "expires_in": '1000000'
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
| WORKSPACE_ID   | Yes      | Workspace identifier   |
| AUTH-SECRET_ID | Yes      | Auth-secret identifier |


### Returns

The Auth-secret with given ID


## Patch the Auth-secret


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
            "access_token": '{ACCESS_TOKEN}',
            "refresh_token": '{REFRESH_TOKEN}',
            "expires_in": '1000000'
          }
        },
        "auth-client": {
          "data": {
            "id": "{AUTH-CLIENT_ID}",
            "type": "auth-client"
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
        "access_token": '{ACCESS_TOKEN}',
        "refresh_token": '{REFRESH_TOKEN}',
        "expires_in": '1000000'
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

This resource allows you to update the Auth secret. If related Auth-client has type ``oauth2`` then ``credentials``
object must contain only properties ``access_token``, ``refresh_token``, ``expires_in``, otherwise if the type 
is ``other`` than you can put in credentials any data that you want.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.edit` permission.

### URL Parameters

| Parameter         | Required  | Description             |
| :---              | :---      | :---                    |
| WORKSPACE_ID      | yes       | An Id of the Workspace  |
| AUTH-SECRET_ID    | yes       | An Id of the Auth-secret|


### Body Parameters

| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | A value must be ``auth-secret`` |
| attributes.name                          | no       | New name of the Auth-secret     |
| attributes.credentials                   | no       | Auth-secret credentials         |
| relationships.auth_client.data.id        | no      | An Id of the Auth-client        |

### Returns

Returns the updated Auth-secret object.


## Delete tha auth-secret

> Example Request:

```shell
curl {{ api_base_url }}/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete the Auth-secret.

### HTTP Request

``DELETE {{ api_base_url }/v2/workspaces/{WORKSPACE_ID}/secrets/{AUTH-SECRET_ID}``

#### Authorization

This request is authorized for the workspace's scope members with the `workspaces.auth_secret.delete` permission.

### URL Parameters

| Parameter      | Required | Description    |
| :--------      | :------- | :----------    |
| WORKSPACE_ID   | yes      | An Id of the Workspace     |
| AUTH-SECRET_ID | yes      | Auth-secret ID |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
