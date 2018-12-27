# Tenants

## What is a Tenant?

**Tenant** is a specific system's environment virtual installation (a system's clone, in other words) that allows customizing all the necessary parameters by sending a particular request to the API. Check the request examples below.

## Get Tenant's roles

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"{TENANT-POLICY_ID}",
    "type":"tenant-policy",
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
      "tenant":{
        "data":{
          "id":"{TENANT_ID}",
          "type":"tenant"
        },
        "links":{
          "self":"/v2/tenants/{TENANT_ID}"
        }
      }
    }
  },
  "meta":{

  },
  "links":{
    "self":"/v2/tenants/{TENANT_ID}/roles"
  }
}

```

This endpoint returns the Tenants' Roles for a specific Tenant.


### HTTP Request

`GET {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

The client has to have the privileges of the `Tenant Admin`. To request these Role types, please contact our support team.
The `Tenant Admin` can get only his/her tenants.


### URL Parameters
Parameter       | Description
--------------- | -----------
TENANT_ID | The ID of the Tenant


## Get the list of available permissions 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/permissions
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":null,
    "type":"permissions",
    "attributes":{
      "permissions":[
        "contracts.membership.edit",
        "contracts.workspace.create",
        "contracts.workspace.listAll",
        "contracts.workspace.delete",
        "contracts.repository.edit",
        "contracts.devTeam.edit",
        "workspaces.workspace.edit",
        "workspaces.flow.edit",
        "workspaces.flow.toggleStatus",
        "workspaces.flow.toggleRealtime",
        "workspaces.credential.edit"
      ]
    }
  },
  "meta":{}
}
```
This endpoint returns all available permissions required for creating a Role.


### HTTP Request

`GET {{ api_base_url }}/v2/permissions`

#### Authorization

This endpoint is available to all the platforms' users.


## Update Tenant's roles 

> Example Request:

```shell
 curl {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles
   -X PATCH
   -u {EMAIL}:{APIKEY}
   -H 'Content-Type: application/json' -d '
    {
      "data":{
        "type":"tenant-policy",
        "attributes":{
          "roles":[
            {
              "role":"name_of_new_role",
              "scope":"contracts",
              "permissions":[
                "contracts.workspace.create",
                "contracts.devTeam.edit"
              ],
              "i18n":{
                "en":"new_role"
              }
            },
            {
              "role":"name_of_new_role",
              "scope":"workspaces",
              "permissions":[
                "workspaces.flow.edit",
                "workspaces.flow.toggleStatus",
                "workspaces.flow.toggleRealtime"
              ],
              "i18n":{
                "en":"new_role"
              }
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
    "type":"tenant-policy",
    "attributes":{
      "roles":[
        {
          "i18n":{
            "en":"new_role"
          },
          "role":"name_of_new_role",
          "permissions":[
            "contracts.workspace.create",
            "contracts.devTeam.edit"
          ],
          "scope":"contracts"
        },
        {
          "i18n":{
            "en":"new_role"
          },
          "role":"name_of_new_role",
          "permissions":[
            "workspaces.flow.edit",
            "workspaces.flow.toggleStatus",
            "workspaces.flow.toggleRealtime"
          ],
          "scope":"workspaces"
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
      "tenant":{
        "data":{
          "id":"{TENANT_ID}",
          "type":"tenant"
        },
        "links":{
          "self":"/v2/tenants/{TENANT_ID}"
        }
      }
    }
  },
  "meta":{

  },
  "links":{
    "self":"/v2/tenants/{TENANT_ID}/roles"
  }
}
```

### HTTP Request

`PATCH {{ api_base_url }}/v2/tenants/{TENANT_ID}/roles`

#### Authorization

The client has to have the privileges of the `Service Account` record type.


### URL Parameters
Parameter       | Description
--------------- | -----------
TENANT_ID | The ID of the Tenant

### Payload Parameters
Parameter       | Required | Description
--------------- | -------- | -----------
type            | yes      | A value should be "tenant-policy"
attributes.roles[] | yes      |An array of Tenant's roles. It can be empty. 
attributes.roles[].role | no     | Name of a role.
attributes.roles[].scope | no      | The group of objects, which is affected by this role. Value can be "contracts" or "workspaces" 
attributes.roles[].permissions[] | yes      | An array of permissions. It can be empty. To get the list of available permissions execute `GET {{ api_base_url }}/v2/permissions` endpoint
attributes.roles[].i18n.{{language_key}} | no      | The name of a role in different languages. The value is only required for "en" key. For other languages value is optional


*Note: these endpoints most likely be modified in a few weeks*
