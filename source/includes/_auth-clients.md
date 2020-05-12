# Auth clients
 
In order to use an OAuth2 based component in the platform it is required to register a client at the authorization 
server. Upon the registration the authorization server issues the registered client a client identifier and a secret.
These client credentials are used to create a client using the following API.

## Retrieve all auth clients


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
| TENANT_ID         | yes       | An Id of the Tenant  |

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
| filter[component] | no        | Filter the Auth-clients only for specific component. Must be `id` of `Component` |


### Returns

Returns all the Auth-clients belonging to the given Tenant.


## Create the auth client


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
| TENANT_ID         | yes       | An Id of the Tenant  |


### Body Parameters

| Parameter                                | Required | Description |
| :---                                     | :---     | :---        |
| type                                     | yes      | A value must be ``auth-client`` |
| attributes.name                          | yes      | Auth-client name                |
| attributes.type                          | yes      | Auth-client type. May be any of: ``oauth2``, ``other``|
| attributes.credentials                   | yes      | Auth-client credentials |
| attributes.credentials.client_id         | yes(if ``attributes.type`` is ``oauth2``) | Auth-client client id |
| attributes.credentials.client_secret     | yes(if ``attributes.type`` is ``oauth2``) | Auth-client client secret |
| attributes.credentials.refresh_token_url | yes(if ``attributes.type`` is ``oauth2``) | Auth-client refresh token url |
| relationships.components.data[].component.type | yes | A value must be ``component`` |
| relationships.components.data[].component.id | yes | An Id of the Component |

### Returns

Returns the created Auth-client object.


## Retrieve the auth-client by ID

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
name and linked components, otherwise if the type is ``other`` than you can put in credentials any data that you want
and add components which can use this Auth-client.

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}`

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.edit` permission.

### URL Parameters

| Parameter         | Required  | Description            |
| :---              | :---      | :---                   |
| TENANT_ID         | yes       | An Id of the Tenant     |
| AUTH-CLIENT_ID    | yes       | An Id of the Auth-client |


### Body Parameters

| Parameter                                | Required | Description                     |
| :---                                     | :---     | :---                            |
| type                                     | yes      | A value must be ``auth-client`` |
| attributes.name                          | no       | New name of the Auth-client     |
| attributes.credentials                   | no (not allowed for ``oauth2`` type) | Auth-client credentials         |
| relationships.components.data[].component.type | no | A value must be ``component`` |
| relationships.components.data[].component.id | no | An Id of the Component |

### Returns

Returns the updated auth-client object.


## Delete the auth-client

> Example Request:

```shell
curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete the Auth-client. You can't delete an Auth-client, while it has one or more secrets 
attached.

### HTTP Request

``DELETE {{ api_base_url }/v2/tenants/{TENANT_ID}/auth-clients/{AUTH-CLIENT_ID}``

#### Authorization

This request is authorized for the tenant's scope members with the `tenants.auth_clients.delete` permission.

### URL Parameters

| Parameter      | Required | Description         |
| :--------      | :------- | :----------         |
| TENANT_ID      | yes      | An Id of the Tenant |
| AUTH-CLIENT_ID | yes      | Auth-client ID      |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
