# Auth Clients (Experimental)

 <aside class="warning">
 <b>The Auth Clients section is an experimental API</b>
 </aside>

 
In order to use an OAuth2 based Component in the platform it is required to register a client at the authorization 
server. Upon registration the authorization server issues the registered client an identifier (client ID) and a secret.
These client credentials are used to create a client using the following API.

## Retrieve All Auth Clients


> Example Request:


```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients \
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
          "refresh_token_url": "http://example.com",
          "token_expires_in": 18000
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
        "tenant": {
          "data": {
            "id": "{TENANT_ID}",
            "type": "tenant"
          },
          "links": {
            "self": "/v2/tenants/{TENANT_ID}"
          }
        }
      },
      "links": {
        "self": "/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
      }
    }
  ],
  "meta": {}
}
```

This resource allows you to retrieve all the Auth-clients belonging to the given Tenant.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.get` permission.

### URL Parameters

| Parameter         | Required  | Description          |
| :---              | :---      | :---                 |
| TENANT_ID         | yes       | Tenant ID  |

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
| filter[component] | no        | Filter the Auth Clients only for specific component. Must be `id` of `Component` |


### Returns

Returns all the Auth-clients belonging to the given Tenant.


## Create Auth Client


> Example Request:


```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients \
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
          "refresh_token_url":"http://example.com",
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
        "refresh_token_url": "http://example.com",
        "token_expires_in": 18000
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
      "tenant": {
        "data": {
          "id": "{TENANT_ID}",
          "type": "tenant"
        },
        "links": {
          "self": "/v2/tenants/{TENANT_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to create an Auth-client.

### HTTP Request

`POST {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.create` permission.

### URL Parameters

| Parameter         | Required  | Description          |
| :---              | :---      | :---                 |
| TENANT_ID         | yes       | Tenant ID  |


### Body Parameters

| Parameter                                | Required | Description |
| :---                                     | :---     | :---        |
| type                                     | yes      | Allowed value: ``auth-client`` |
| attributes.name                          | yes      | Auth Client name                |
| attributes.type                          | yes      | Auth Client type. May be any of: ``oauth2``, ``other``|
| attributes.credentials                   | yes      | Auth Client credentials |
| attributes.credentials.client_id         | yes (if ``attributes.type`` is ``oauth2``) | Auth Client client ID |
| attributes.credentials.client_secret     | yes (if ``attributes.type`` is ``oauth2``) | Auth Client client secret |
| attributes.credentials.refresh_token_url | yes (if ``attributes.type`` is ``oauth2``) | Auth Client refresh token URL |
| attributes.credentials.token_expires_in  | no  | The value that will be set as `expires_in` in Auth Secret linked to the Auth Client after Auth Secret refresh. |
| relationships.components.data[].component.type | yes | Allowed value: ``component`` |
| relationships.components.data[].component.id | yes | Component ID |

### Returns

Returns the created Auth Client object.


## Retrieve the Auth Client by ID

> Example Request:


```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID} \
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
        "refresh_token_url": "http://example.com",
        "token_expires_in": 18000
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
      "tenant": {
        "data": {
          "id": "{TENANT_ID}",
          "type": "tenant"
        },
        "links": {
          "self": "/v2/tenants/{TENANT_ID}"
        }
      }
    },
    "links": {
      "self": "/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
    }
  },
  "meta": {}
}
```

This resource allows you to retrieve an Auth Client by its ID. If the Auth Client with given ID does not belong
to the current Tenant, an error will be returned.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.get` permission.

### URL Parameters

| Parameter      | Required | Description            |
| :---           | :---     | :---                   |
| TENANT_ID      | yes      | Tenant ID      |
| AUTH-CLIENT_ID | yes      | Auth Client ID |


### Returns

The Auth Client with given ID


## Update the Auth Client


> Example Request:


```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID} \
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
           "refresh_token_url": "http://example.com",
           "token_expires_in": 18000
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
       "self":"/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}"
     }
   },
   "meta":{}
}
```

This resource allows you to update the Auth Client. If the Auth Client with type ``oauth2`` then you can update 
name, `token_expires_in` and linked components, otherwise if the type is ``other``, then you can put in credentials any data that you want
and add components which can use this Auth Client.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.edit` permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| TENANT_ID         | yes       | Tenant ID    |
| AUTH-CLIENT_ID    | yes       | Auth Client ID |


### Body Parameters

| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | Allowed value: ``auth-client`` |
| attributes.name                          | no       | New name of the Auth Client     |
| attributes.credentials.token_expires_in  | no       | The value that will be set as `expires_in` in Auth Secret linked to the Auth Client after Auth Secret refresh.|
| relationships.components.data[].component.type | no | Allowed value: ``component`` |
| relationships.components.data[].component.id | no | Component ID |

### Returns

Returns the updated Auth Client object.


## Delete Auth Client

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete an Auth Client. You can't delete an Auth Client, while it has one or more secrets 
attached.

### HTTP Request

``DELETE {{ api_base_url }/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}``

#### Authorization

This request is authorized for the Tenant's scope members with the `tenants.auth_clients.delete` permission.

### URL Parameters

| Parameter      | Required | Description         |
| :--------      | :------- | :----------         |
| TENANT_ID      | yes      | Tenant ID |
| AUTH-CLIENT_ID | yes      | Auth Client ID      |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
