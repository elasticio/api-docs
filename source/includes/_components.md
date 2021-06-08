# Components

## Accessing and sharing components

Each ``Component`` belongs to a ``Team``. Each ``User``  who is a member of the team can edit the component.

The component has an attribute ``access``, which indicates how is the component shared by the other clients. "Shared" means, that the component can be used by the users in their flows.
There are three sharing modes:

- ``team`` – no sharing. Only Contract members can use the Component.
- ``tenant`` – the Component can be used by the other clients in the same Tenant.
- ``global`` – a special mode for Components from the standard Component set of the Platform (e.g. `Timer`, `Webhook` etc). Any Platform user can use `global` components.

Accordingly, a set of components, available for each user is consist of: not shared components from the user's Contract, components with `tenant` access and `global` components.

## Retrieve all available components


> Example Request:


```shell
curl {{ api_base_url }}/v2/components?contract_id={CONTRACT_ID} \
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
      "id":"{COMPONENT_ID}",
      "type":"component",
      "links":{
        "self":"/v2/components/{COMPONENT_ID}"
      },
      "attributes":{
        "name":"name",
        "team_name":"team_name",
        "access": "tenant"
      },
      "relationships":{
        "versions":{
          "links":{
            "related":"/v2/components/{COMPONENT_ID}/versions"
          }
        },
        "latest_version":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"version"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/latest"
          }
        }
      }
    }
  ],
  "meta":{},
  "included":[
    {
      "id":"{GIT_REVISION}",
      "type":"version",
      "links":{
        "self":"/v2/versions/{GIT_REVISION}"
      },
      "attributes":{
        "date":1517392057184,
        "version_number":69
      },
      "relationships":{
        "descriptor":{
          "data":{
            "id":"0eff1d1a46b78ba1f468982e16d0382e8a91280d",
            "type":"descriptor"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
          }
        },
        "component":{
          "data":{
            "id":"{COMPONENT_ID}",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}"
          }
        }
      }
    },
    {
      "id":"0eff1d1a46b78ba1f468982e16d0382e8a91280d",
      "type":"descriptor",
      "links":{
        "self":"/v2/descriptors/0eff1d1a46b78ba1f468982e16d0382e8a91280d"
      },
      "attributes":{
        "repo_name":"repo_name",
        "team_name":"team_name",
        "short_revision":"0eff1d1",
        "is_latest":true,
        "description":"desc",
        "icon":"BASE64",
        "language":"nodejs",
        "sailor_version":"2.1.6",
        "title":"Data mapper",
        "service":"mapper",
        "actions":{
          "map":{
            "title":"Mapper",
            "main":"./map.js"
          },
          "jsonataMap":{
            "title":"Jsonata mapper",
            "main":"./jsonata_map.js"
          }
        },
        "fields":{
          "mapper":{
            "viewClass":"MapperView"
          }
        }
      },
      "relationships":{
        "version":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"version"
          },
          "links":{
            "self":"/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
          }
        }
      }
    }
  ],
  "links":{
    "self":"/v2/components"
  }
}
```

This endpoint retrieves a list of available components.
Response includes latest [descriptor](#retrieve-a-component-descriptor) for each component.
More details about the component descriptors can be found [here](#component-descriptor-doc). 

### HTTP Request

`GET {{ api_base_url }}/v2/components?contract_id={CONTRACT_ID}`

### HTTP Request with parameters

`GET {{ api_base_url }}/v2/components?contract_id={CONTRACT_ID}&filter[access]=private`

### Query Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
|contract_id|yes|An Id of the Contract|
| filter[access] | No | Allowed values: ``private`` (only components from own Contract returned), ``public`` (only shared components from the other Contracts) and ``all`` (default value, returns all available components).|

### Returns

Returns repositories metadata object if the call succeeded.







## Retrieve all components


> Example Request:


```shell
curl {{ api_base_url }}/v2/components/all \
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
      "id":"{COMPONENT_ID}",
      "type":"component",
      "links":{
        "self":"/v2/components/{COMPONENT_ID}"
      },
      "attributes":{
        "name":"name",
        "team_name":"team_name",
        "access": "tenant"
      },
      "relationships":{
        "versions":{
          "links":{
            "related":"/v2/components/{COMPONENT_ID}/versions"
          }
        },
        "latest_version":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"version"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/latest"
          }
        }
      }
    }
  ],
  "meta":{},
  "included":[
    {
      "id":"{GIT_REVISION}",
      "type":"version",
      "links":{
        "self":"/v2/versions/{GIT_REVISION}"
      },
      "attributes":{
        "date":1517392057184,
        "version_number":69
      },
      "relationships":{
        "descriptor":{
          "data":{
            "id":"0eff1d1a46b78ba1f468982e16d0382e8a91280d",
            "type":"descriptor"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
          }
        },
        "component":{
          "data":{
            "id":"{COMPONENT_ID}",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}"
          }
        }
      }
    },
    {
      "id":"0eff1d1a46b78ba1f468982e16d0382e8a91280d",
      "type":"descriptor",
      "links":{
        "self":"/v2/descriptors/0eff1d1a46b78ba1f468982e16d0382e8a91280d"
      },
      "attributes":{
        "repo_name":"repo_name",
        "team_name":"team_name",
        "short_revision":"0eff1d1",
        "is_latest":true,
        "description":"desc",
        "icon":"BASE64",
        "language":"nodejs",
        "sailor_version":"2.1.6",
        "title":"Data mapper",
        "service":"mapper",
        "actions":{
          "map":{
            "title":"Mapper",
            "main":"./map.js"
          },
          "jsonataMap":{
            "title":"Jsonata mapper",
            "main":"./jsonata_map.js"
          }
        },
        "fields":{
          "mapper":{
            "viewClass":"MapperView"
          }
        }
      },
      "relationships":{
        "version":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"version"
          },
          "links":{
            "self":"/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
          }
        }
      }
    }
  ],
  "links":{
    "self":"/v2/components"
  }
}
```

This endpoint retrieves a list of all components.
Response includes latest [descriptor](#retrieve-a-component-descriptor) for each component.
More details about the component descriptors can be found [here](#component-descriptor-doc).

### HTTP Request

`GET {{ api_base_url }}/v2/components/all`

#### Authorization
This request is authorized only for the User with `tenants.component.list_all` permission.

### Query Parameters

| Parameter      | Required | Description           |
| :---           | :---     | :---                  |
|contract_id     | no       | An Id of the Contract |

### Returns

Returns repositories metadata object if the call succeeded.











## Retrieve a component by ID


> Example Request:


```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"{COMPONENT_ID}",
    "type":"component",
    "links":{
      "self":"/v2/components/{COMPONENT_ID}"
    },
    "attributes":{
      "name":"component name",
      "team_name":"{team_name}",
      "access": "team"
    },
    "relationships":{
      "versions":{
        "links":{
          "related":"/v2/components/{COMPONENT_ID}/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"{GIT_REVISION}",
          "type":"version"
        },
        "links":{
          "self":"/v2/components/{COMPONENT_ID}/versions/latest"
        }
      }
    }
  },
  "meta":{},
  "included":[
    {
      "id":"{GIT_REVISION}",
      "type":"version",
      "links":{
        "self":"/v2/versions/{GIT_REVISION}"
      },
      "attributes":{
        "date":1513183339032,
        "version_number":7
      },
      "relationships":{
        "descriptor":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"descriptor"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
          }
        },
        "component":{
          "data":{
            "id":"{COMPONENT_ID}",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}"
          }
        }
      }
    },
    {
      "id":"{GIT_REVISION}",
      "type":"descriptor",
      "links":{
        "self":"/v2/descriptors/{GIT_REVISION}"
      },
      "attributes":{
        "repo_name":"repo_name",
        "team_name":"team_name",
        "short_revision":"df7cf1d",
        "is_latest":true,
        "description":"desc",
        "icon":"BASE64",
        "language":"nodejs",
        "sailor_version":"2.2.1",
        "title":"title",
        "actions":{
          "update":"<Actions Object>"
        },
        "triggers":{
          "select":"<Triggers Object>"
        },
        "credentials":{
          "fields":{
            "apiKey":{
              "label":"API key",
              "required":true,
              "viewClass":"TextFieldWithNoteView",
              "note":"{note}"
            }
          }
        }
      },
      "relationships":{
        "version":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"version"
          },
          "links":{
            "self":"/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
          }
        }
      }
    }
  ]
}
```


### HTTP Request

``GET {{ api_base_url }}/v2/components/{COMPONENT_ID}``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |


### Authorization
The component should be accessible to the client (e.g. component from the own Contract or shared one).
  

### Returns

This endpoint returns a component object and includes latest [descriptor](#retrieve-a-component-descriptor) for each component.





















## Retrieve component versions


> Example Request:


```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions \
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
      "id":"{GIT_REVISION}",
      "type":"version",
      "links":{
        "self":"/v2/versions/{GIT_REVISION}"
      },
      "attributes":{
        "date":1508754889997,
        "version_number":1
      },
      "relationships":{
        "descriptor":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"descriptor"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
          }
        },
        "component":{
          "data":{
            "id":"{COMPONENT_ID}",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}"
          }
        }
      }
    }
  ],
  "meta":{},
  "links":{
    "self":"/v2/components/{COMPONENT_ID}/versions"
  }
}
```

This endpoint retrieves list of component's versions

### HTTP Request

`GET {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |


### Authorization
The component should be accessible to the client (e.g. component from the own Contract or shared one).


### Returns

Returns repositories build metadata object if the call succeeded.











## Retrieve a component descriptor


> Example Request:


```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "id":"{GIT_REVISION}",
    "type":"descriptor",
    "links":{
      "self":"/v2/descriptors/{GIT_REVISION}"
    },
    "attributes":{
      "repo_name":"repo_name",
      "team_name":"team_name",
      "short_revision":"cf0a2d9",
      "is_latest":true,
      "description":"desc",
      "icon":"BASE64",
      "language":"nodejs",
      "sailor_version":"2.2.1",
      "title":"title",
      "actions":{
        "update":"<Actions Object>"
      },
      "triggers":{
        "select":"<Triggers Object>"
      },
      "credentials":{
        "fields":{
          "apiKey":{
            "label":"API key",
            "required":true,
            "viewClass":"TextFieldWithNoteView",
            "note":"note"
          }
        }
      }
    },
    "relationships":{
      "version":{
        "data":{
          "id":"{GIT_REVISION}",
          "type":"version"
        },
        "links":{
          "self":"/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
        }
      }
    }
  },
  "meta":{}
}
```

This endpoint retrieves an information about single component by it's ``ID`` and/or ``version``,
for latest version use ``latest``. More details can be find [here](#retrieve-a-component-descriptor).

### HTTP Request

`GET {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor`

or

`GET {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/latest/descriptor`



### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |
| GIT_REVISION | Yes | Revision of the component’s build. Use ``latest`` to retrieve the descriptor of the most recent successful build. |


### Authorization
The component should be accessible for the client (e.g. component from own Contract or shared one).



### Returns

Returns component [descriptor](#retrieve-a-component-descriptor) if the call succeeded.













## Create a component repository


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/ \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
   -H 'Content-Type: application/json' -d '
      {
        "data":{
          "type":"component",
          "attributes":{
            "name":"mycomponent"
          },
          "relationships":{
            "team":{
              "data":{
                "type":"team",
                "id":"{TEAM_ID}"
              }
            },
            "contract":{
              "data":{
                "type":"contract",
                "id":"{CONTRACT_ID}"
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
  "data":{
    "id":"{REPOSITORY_ID}",
    "type":"component",
    "links":{
      "self":"/v2/components/{REPOSITORY_ID}"
    },
    "attributes":{
      "name":"{REPOSITORY_NAME}",
      "team_name":"{TEAM_NAME}",
      "access": "team"
    },
    "relationships":{
      "versions":{
        "links":{
          "related":"/v2/components/{REPOSITORY_ID}/versions"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a component repository. A component repository always belongs to a team.
If you don't have any teams yet, please [create a team](#create-team) first.

### HTTP Request

``POST {{ api_base_url }}/v2/components``

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``component`` |
| attributes.name | yes | Repository name |
| attributes.icon | no | Component icon as base64 string |
| relationships.team.data.id | yes | Team ID the repository to create for |
| relationships.team.data.type | yes | A value must be ``team`` |
| relationships.contract.data.id | no | Contract ID the repository to create for |
| relationships.contract.data.type | no | A value must be ``contract`` |


### Authorization
This request is authorized to a user with `contracts.repository.edit` permission.

### Returns

Returns component's metadata object if the call succeeded.














## Update component access

This resource allows you to changing component's access level from `team` to `tenant`.

Please note, that this action is irreversible i.e. API does not allow to change `access` back to `team`.

> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
   -H 'Content-Type: application/json' -d '
   {
       "data": {
           "type": "component",
           "attributes": {
               "access": "tenant"
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
    "id":"{COMPONENT_ID}",
    "type":"component",
    "links":{
      "self":"/v2/components/{COMPONENT_ID}"
    },
    "attributes":{
      "name":"name",
      "team_name":"team_name",
      "access": "tenant"
    },
    "relationships":{
      "versions":{
        "links":{
          "related":"/v2/components/{COMPONENT_ID}/versions"
        }
      }
    }
  },
  "meta":{}
}
```
### HTTP Request

``PATCH {{ api_base_url }}/v2/components/{COMPONENT_ID}``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | 
| COMPONENT_ID | Yes | Component identifier |

### Access level

A component may have one of the following access level:

- ``team`` – no sharing. Only team members can use the component.
- ``tenant`` – component could be used by the other clients in the tenant.
- ``global`` – special mode for components from the standard set of components of the Platform (e.g. ``Timer``, ``Webhook`` etc). Any user of the platform can use ``global`` components.

### Authorization
This request is authorized for a user with ``TenantAdmin`` role only. Contact support team to get this role.


### Returns
Returns updated component's metadata object if the call succeeded.














## Delete a component


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to delete a component. A component may only be delete if it not used in any flow.



### HTTP Request

``DELETE {{ api_base_url }}/v2/components/{COMPONENT_ID}/``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Component ID |


### Authorization
This request is authorized to a user with `contracts.repository.edit` permission. The component must belong to one of the client’s team.

### Returns

204 HTTP response code if the call succeeds, error otherwise.







## Delete a version of the component 


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{VERSION_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to delete a component version. A version of the component may only be deleted if it not used in any flow.



### HTTP Request

``DELETE {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{VERSION_ID}``

### URL Parameters

| Parameter    | Required | Description                                                                                   |
| :----------- | :------- | :-------------------------------------------------------------------------------------------- |
| COMPONENT_ID | yes      | Component ID                                                                                  |
| VERSION_ID   | yes      | Revision or version of the component’s build. Use ``latest`` to delete the most recent successful build. |


### Authorization
This request is authorized to a user with `contracts.repository.edit` permission. The component must belong to one of the user’s team.

### Returns

204 HTTP response code if the call succeeds, error otherwise.



## Deprecate a version of the component


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{VERSION_ID}/deprecate \
   -X POST \
   -u {EMAIL}:{APIKEY}
```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    {
      "id":"{GIT_REVISION}",
      "type":"version",
      "links":{
        "self":"/v2/versions/{GIT_REVISION}"
      },
      "attributes":{
        "date":1508754889997,
        "version_number":1
      },
      "relationships":{
        "descriptor":{
          "data":{
            "id":"{GIT_REVISION}",
            "type":"descriptor"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
          }
        },
        "component":{
          "data":{
            "id":"{COMPONENT_ID}",
            "type":"component"
          },
          "links":{
            "self":"/v2/components/{COMPONENT_ID}"
          }
        }
      }
    }
  },
  "meta":{},
  "links":{
    "self":"/v2/components/{COMPONENT_ID}/versions"
  }
}
```

This resource allows you to deprecate a component version.



### HTTP Request

``POST {{ api_base_url }}/v2/components/{COMPONENT_ID}/versions/{VERSION_ID}/deprecate``

### URL Parameters

| Parameter    | Required | Description                                                                                   |
| :----------- | :------- | :-------------------------------------------------------------------------------------------- |
| COMPONENT_ID | yes      | Component ID                                                                                  |
| VERSION_ID   | yes      | Revision or version of the component’s build. Use ``latest`` to delete the most recent successful build. |


### Authorization
The component must belong to one of the authorized user’s teams.

### Returns

200 HTTP response code if the call succeeds, error otherwise.



## Retrieve component's environment variables


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/env \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'

```


> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
  "data":{
    "attributes":{
      "vars":{
        "MY_ENV_VAR":"env_var_value"
      }
    },
    "id":"{COMPONENT_ID}",
    "type":"component-env",
    "links":{
      "self":"/v2/component-envs/{COMPONENT_ID}"
    }
  },
  "meta":{}
}
```

This endpoint shows env vars for given component.


### HTTP Request

``GET {{ api_base_url }}/v2/components/{COMPONENT_ID}/env``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Component ID |


### Authorization
The component should be accessible to the client (e.g. component from the own team or shared one).


### Returns

Returns environment variables














## Update component's environment variables


> Example Request:

```shell
curl {{ api_base_url }}/v2/components/{COMPONENT_ID}/env \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
   {
       "data": {
           "type": "component-env",
           "attributes": {
               "vars": {
                   "MY_ENV_VAR": "env_var_value"
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
    "attributes":{
      "vars":{
        "MY_ENV_VAR":"env_var_value"
      }
    },
    "id":"{COMPONENT_ID}",
    "type":"component-env",
    "links":{
      "self":"/v2/component-envs/{COMPONENT_ID}"
    }
  },
  "meta":{}
}
```

This endpoint replaces env vars for given component.



### HTTP Request

`PUT {{ api_base_url }}/v2/components/{COMPONENT_ID}/env`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Component ID |

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``component-env`` |
| attributes.vars | yes | JSON object representing environmental variables mapped to their values. |


### Authorization
The component should be accessible to the client (e.g. component from the own team or shared one).



### Returns

Returns environment variables
