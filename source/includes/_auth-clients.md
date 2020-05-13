# Auth Clients
 
In order to use an OAuth2 based Component in the platform it is required to register a client at the authorization 
server. Upon registration the authorization server issues the registered client an identifier (client identifier) and a secret.
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
          "client_id": '{CLIENT_ID}',
          "client_secret": '{CLIENT_SECRET}',
          "refresh_token_url": 'http://example.com'
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
| filter[component] | no        | Filter the Auth-clients only for specific component. Must be `id` of `Component` |


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
           "client_id": '{CLIENT_ID}',
           "client_secret": '{CLIENT_SECRET}',
           "refresh_token_url": 'http://example.com'
         }
       },
       "components":{
         "data": [
           {
             "id":"{COMPONENT_ID}",
             "type":"component"
           }
         ]
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
        "client_id": '{CLIENT_ID}',
        "client_secret": '{CLIENT_SECRET}',
        "refresh_token_url": 'http://example.com'
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
| attributes.name                          | yes      | Auth-client name                |
| attributes.type                          | yes      | Auth-client type. May be any of: ``oauth2``, ``other``|
| attributes.credentials                   | yes      | Auth-client credentials |
| attributes.credentials.client_id         | yes(if ``attributes.type`` is ``oauth2``) | Auth-client client id |
| attributes.credentials.client_secret     | yes(if ``attributes.type`` is ``oauth2``) | Auth-client client secret |
| attributes.credentials.refresh_token_url | yes(if ``attributes.type`` is ``oauth2``) | Auth-client refresh token url |
| relationships.components.data[].component.type | yes | Allowed value: ``component`` |
| relationships.components.data[].component.id | yes | Component ID |

### Returns

Returns the created Auth-client object.


## Retrieve the Auth-client by ID

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
        "client_id": '{CLIENT_ID}',
        "client_secret": '{CLIENT_SECRET}',
        "refresh_token_url": 'http://example.com'
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

This resource allows you to retrieve the Auth-client by its identifier. If the Auth-client with given ID does not belong
to the current Tenant, an error will be returned.

### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.get` permission.

### URL Parameters

| Parameter      | Required | Description            |
| :---           | :---     | :---                   |
| TENANT_ID      | Yes      | Tenant identifier      |
| AUTH-CLIENT_ID | Yes      | Auth-client identifier |


### Returns

The Auth-client with given ID


## Update the auth client


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
         "name":"Auth client"
       },
       "components": {
         "data": [
           {
             "id": "{COMPONENT_ID}",
             "type": "component"
           }
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
      "id":"{AUTH-CLIENT_ID}",
      "type":"auth-client",
      "attributes":{
         "type":"oauth2",
         "name":"Auth client",
         "credentials":{
           "client_id": '{CLIENT_ID}',
           "client_secret": '{CLIENT_SECRET}',
           "refresh_token_url": 'http://example.com'
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

This resource allows you to update the Auth-client. If the Auth-client with type ``oauth2`` then you can update only 
name and linked components, otherwise if the type is ``other``, then you can put in credentials any data that you want
and add components which can use this Auth-client.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.edit` permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| TENANT_ID         | yes       | Tenant ID    |
| AUTH-CLIENT_ID    | yes       | Auth-client ID |


### Body Parameters

| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | Allowed value: ``auth-client`` |
| attributes.name                          | no       | New name of the Auth-client     |
| attributes.credentials                   | no (not allowed for ``oauth2`` type) | Auth-client credentials         |
| relationships.components.data[].component.type | no | Allowed value: ``component`` |
| relationships.components.data[].component.id | no | Component ID |

### Returns

Returns the updated auth-client object.


## Delete Auth-client

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete an Auth-client. You can't delete an Auth-client, while it has one or more secrets 
attached.

### HTTP Request

``DELETE {{ api_base_url }/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}``

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.delete` permission.

### URL Parameters

| Parameter      | Required | Description         |
| :--------      | :------- | :----------         |
| TENANT_ID      | yes      | Tenant ID |
| AUTH-CLIENT_ID | yes      | Auth-client ID      |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
