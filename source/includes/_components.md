# Components

## Accessing and sharing components

Each ``Component`` belongs to a ``Team``. Each ``User``  who is a member of the team can edit the component.

The component has an attribute ``access``, which indicates how is the component shared by the other clients. "Shared" means, that the component can be used by the users in their flows.
There are three sharing modes:

- ``team`` – no sharing. Only organization members can use the component.
- ``tenant`` – component could be used by the other clients in the tenant.
- ``global`` – special mode for components from the standard set of components of Elastic.io Platform (e.g. ``timer``, ``webhook`` etc). Any user of the platform can use ``global`` components.

Accordingly, a set of components, available for each user is consist of: not shared components from the user's organization, components with ``tenant`` access and ``global`` components.


## Retrieve all components


> Example Request:


```shell
curl https://api.elastic.io/v2/components \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": [
        {
            "id": "{COMPONENT_ID}",
            "type": "component",
            "links": {
                "self": "/v2/components/{COMPONENT_ID}"
            },
            "attributes": {
                "name": "name",
                "team_name": "team_name"
            },
            "relationships": {
                "versions": {
                    "links": {
                        "related": "/v2/components/{COMPONENT_ID}/versions"
                    }
                },
                "latest_version": {
                    "data": {
                        "id": "{GIT_REVISION}",
                        "type": "version"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/latest"
                    }
                }
            }
        },
//..........................
]
"meta": {},
    "included": [
        {
            "id": "{GIT_REVISION}",
            "type": "version",
            "links": {
                "self": "/v2/versions/{GIT_REVISION}"
            },
            "attributes": {
                "date": 1517392057184,
                "version_number": 69
            },
            "relationships": {
                "descriptor": {
                    "data": {
                        "id": "0eff1d1a46b78ba1f468982e16d0382e8a91280d",
                        "type": "descriptor"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                    }
                },
                "component": {
                    "data": {
                        "id": "{COMPONENT_ID}",
                        "type": "component"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}"
                    }
                }
            }
        },
        {
            "id": "0eff1d1a46b78ba1f468982e16d0382e8a91280d",
            "type": "descriptor",
            "links": {
                "self": "/v2/descriptors/0eff1d1a46b78ba1f468982e16d0382e8a91280d"
            },
            "attributes": {
                "repo_name": "repo_name",
                "team_name": "team_name",
                "short_revision": "0eff1d1",
                "is_latest": true,
                "description": "desc",
                "icon": "BASE64",
                "language": "nodejs",
                "sailor_version": "2.1.6",
                "title": "Data mapper",
                "service": "mapper",
                "actions": {
                    "map": {
                        "title": "Mapper",
                        "main": "./map.js"
                    },
                    "jsonataMap": {
                        "title": "Jsonata mapper",
                        "main": "./jsonata_map.js"
                    }
                },
                "fields": {
                    "mapper": {
                        "viewClass": "MapperView"
                    }
                }
            },
            "relationships": {
                "version": {
                    "data": {
                        "id": "{GIT_REVISION}",
                        "type": "version"
                    },
                    "links": {
                        "self": "/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
                    }
                }
            }
        },
//....................................
],
    "links": {
        "self": "/v2/components"
    }
}
```

This endpoint retrieves a list of available components.
Response includes latest [descriptor](#retrieve-a-component-descriptor) for each component.
More details about the component descriptors can be found [here](#component-descriptor-doc). 

### HTTP Request

`GET https://api.elastic.io/v2/components`


### Query Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| filter[access] | No | Allowed values: ``private`` (only components from own organizations returned), ``public`` (only shared components from the other organizations) and ``all`` (default value, returns all available components).|

### Returns

Returns repositories metadata object if the call succeeded.











## Retrieve a component by ID


> Example Request:


```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID} \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "id": "{COMPONENT_ID}",
        "type": "component",
        "links": {
            "self": "/v2/components/{COMPONENT_ID}"
        },
        "attributes": {
            "name": "component name",
            "team_name": "{team_name}"
        },
        "relationships": {
            "versions": {
                "links": {
                    "related": "/v2/components/{COMPONENT_ID}/versions"
                }
            },
            "latest_version": {
                "data": {
                    "id": "{GIT_REVISION}",
                    "type": "version"
                },
                "links": {
                    "self": "/v2/components/{COMPONENT_ID}/versions/latest"
                }
            }
        }
    },
    "meta": {},
    "included": [
        {
            "id": "{GIT_REVISION}",
            "type": "version",
            "links": {
                "self": "/v2/versions/{GIT_REVISION}"
            },
            "attributes": {
                "date": 1513183339032,
                "version_number": 7
            },
            "relationships": {
                "descriptor": {
                    "data": {
                        "id": "{GIT_REVISION}",
                        "type": "descriptor"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                    }
                },
                "component": {
                    "data": {
                        "id": "{COMPONENT_ID}",
                        "type": "component"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}"
                    }
                }
            }
        },
        {
            "id": "{GIT_REVISION}",
            "type": "descriptor",
            "links": {
                "self": "/v2/descriptors/{GIT_REVISION}"
            },
            "attributes": {
                "repo_name": "repo_name",
                "team_name": "team_name",
                "short_revision": "df7cf1d",
                "is_latest": true,
                "description": "desc",
                "icon": "BASE64",
                "language": "nodejs",
                "sailor_version": "2.2.1",
                "title": "title",
                "actions": {update": "<Actions Object>},
                "triggers": {"select": "<Triggers Object>"},
                "credentials": {
                    "fields": {
                        "apiKey": {
                            "label": "API key",
                            "required": true,
                            "viewClass": "TextFieldWithNoteView",
                            "note": "{note}"
                        }
                    }
                }
            },
            "relationships": {
                "version": {
                    "data": {
                        "id": "{GIT_REVISION}",
                        "type": "version"
                    },
                    "links": {
                        "self": "/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
                    }
                }
            }
        }
    ]
}
```


### HTTP Request

``GET https://api.elastic.io/v2/components/{COMPONENT_ID}``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |


### Authorization
The component should be accessible to the client (e.g. component from the own organization or shared one) unless it has ``TenantAdmin`` role. Contact support team to get this role.
  

### Returns

This endpoint returns a component object and includes latest [descriptor](#retrieve-a-component-descriptor) for each component.





















## Retrieve component versions


> Example Request:


```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/versions \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": [
        {
            "id": "{GIT_REVISION}",
            "type": "version",
            "links": {
                "self": "/v2/versions/{GIT_REVISION}"
            },
            "attributes": {
                "date": 1508754889997,
                "version_number": 1
            },
            "relationships": {
                "descriptor": {
                    "data": {
                        "id": "{GIT_REVISION}",
                        "type": "descriptor"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                    }
                },
                "component": {
                    "data": {
                        "id": "{COMPONENT_ID}",
                        "type": "component"
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}"
                    }
                }
            }
        }
    ],
    "meta": {},
    "links": {
        "self": "/v2/components/{COMPONENT_ID}/versions"
    }
}
```

This endpoint retrieves list of component's versions

### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/versions`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |


### Authorization
The component should be accessible to the client (e.g. component from the own organization or shared one) unless it has ``TenantAdmin`` role. Contact support team to get this role.


### Returns

Returns repositories build metadata object if the call succeeded.











## Retrieve a component descriptor


> Example Request:


```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
```


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "id": "{GIT_REVISION}",
        "type": "descriptor",
        "links": {
            "self": "/v2/descriptors/{GIT_REVISION}"
        },
        "attributes": {
            "repo_name": "repo_name",
            "team_name": "team_name",
            "short_revision": "cf0a2d9",
            "is_latest": true,
            "description": "desc",
            "icon":"BASE64",
            "language": "nodejs",
            "sailor_version": "2.2.1",
            "title": "title",
            "actions": {
                "update": "<Actions Object>"
            },
            "triggers": {
                "select": "<Triggers Object>"
            },
            "credentials": {
                "fields": {
                    "apiKey": {
                        "label": "API key",
                        "required": true,
                        "viewClass": "TextFieldWithNoteView",
                        "note": "note"
                    }
                }
            }
        },
        "relationships": {
            "version": {
                "data": {
                    "id": "{GIT_REVISION}",
                    "type": "version"
                },
                "links": {
                    "self": "/v2/{COMPONENT_ID}/versions/{GIT_REVISION}"
                }
            }
        }
    },
    "meta": {}
}
```

This endpoint retrieves an information about single component by it's ``ID`` and/or ``version``,
for latest version use ``latest``. More details can be find [here](#retrieve-a-component-descriptor).

### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor`

or

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/versions/latest/descriptor`



### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |
| GIT_REVISION | Yes | Revision of the component’s build. Use ``latest`` to retrieve the descriptor of the most recent successful build. |


### Authorization
The component should be accessible for the client (e.g. component from own organization or shared one) unless it has `TenantAdmin` role. Contact support team to get this role.



### Returns

Returns component [descriptor](#retrieve-a-component-descriptor) if the call succeeded.













## Create a component repository


> Example Request:

```shell
curl https://api.elastic.io/v2/components/ \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
   -H 'Content-Type: application/json' -d '
   {
       "data": {
           "type": "component",
           "attributes": {
               "name": "mycomponent"
           },
           "relationships": {
               "team": {
                   "data": {
                       "type": "team",
                       "id": "{TEAM_ID}"
                   }
               }
           }
       }
   }'
```


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json
{
    "data": {
        "id": "{REPOSITORY_ID}",
        "type": "component",
        "links": {
            "self": "/v2/components/{REPOSITORY_ID}"
        },
        "attributes": {
            "name": "{REPOSITORY_NAME}",
            "team_name": "{TEAM_NAME}"
        },
        "relationships": {
            "versions": {
                "links": {
                    "related": "/v2/components/{REPOSITORY_ID}/versions"
                }
            }
        }
    },
    "meta": {}
}
```

This resource allows you to create a component repository. A component repository always belongs to a team.
If you don't have any teams yet, please [create a team](#create-team) first.

### HTTP Request

``POST https://api.elastic.io/v2/components``

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``component`` |
| attributes.name | yes | Repository name |
| attributes.icon | no | Component icon as base64 string |
| relationships.team.data.id | yes | Team ID the repository to create for |
| relationships.team.data.type | yes | A value must be ``team`` |


### Returns

Returns component's metadata object if the call succeeded.














## Update component access

This resource allows you to changing component's access level from `team` to `tenant`.

Please note, that this action is irreversible i.e. API does not allow to change `access` back to `team`.

> Example Request:

```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID} \
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "id": "{COMPONENT_ID}",
        "type": "component",
        "links": {
            "self": "/v2/components/{COMPONENT_ID}"
        },
        "attributes": {
            "name": "name",
            "team_name": "team_name"
        },
        "relationships": {
            "versions": {
                "links": {
                    "related": "/v2/components/{COMPONENT_ID}/versions"
                }
            }
        }
    },
    "meta": {}
}
```
### HTTP Request

``PATCH https://api.elastic.io/v2/components/{COMPONENT_ID}``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| COMPONENT_ID | Yes | Component identifier |

### Access level

A component may have one of the following access level:

- ``team`` – no sharing. Only team members can use the component.
- ``tenant`` – component could be used by the other clients in the tenant.
- ``global`` – special mode for components from the standard set of components of Elastic.io Platform (e.g. ``timer``, ``webhook`` etc). Any user of the platform can use ``global`` components.

### Authorization
This request is authorized for a user with ``TenantAdmin`` role only. Contact support team to get this role.


### Returns
Returns updated component's metadata object if the call succeeded.














## Delete a component


> Example Request:

```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 204 No Content
Content-Type: application/json
```

This resource allows you to delete a component. A component may only be delete if it not used in any flow.



### HTTP Request

``DELETE https://api.elastic.io/v2/components/{COMPONENT_ID}/``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Component ID |


### Authorization
The component must belong to one of the client’s team or organization respectively unless it has ``TenantAdmin`` role. Contact support team to get this role.


### Returns

200 HTTP response code if the call succeeds, error otherwise.














## Retrieve component's environment variables


> Example Request:

```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/env \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'

```

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "attributes": {
            "vars": {
                "MY_ENV_VAR": "env_var_value"
            }
        },
        "id": "{COMPONENT_ID}",
        "type": "component-env",
        "links": {
            "self": "/v2/component-envs/{COMPONENT_ID}"
        },
    },
    "meta": {}
}
```

This endpoint shows env vars for given component.


### HTTP Request

``GET https://api.elastic.io/v2/components/{COMPONENT_ID}/env``

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| COMPONENT_ID | yes | Component ID |


### Authorization
The component should be accessible to the client (e.g. component from the own team or shared one) unless it has ``TenantAdmin`` role. Contact support team to get this role.


### Returns

Returns environment variables














## Update component's environment variables


> Example Request:

```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/env \
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

```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "attributes": {
            "vars": {
                "MY_ENV_VAR": "env_var_value"
            }
        },
        "id": "{COMPONENT_ID}",
        "type": "component-env"
    },
    "meta": {}
}
```

This endpoint replaces env vars for given component.



### HTTP Request

``PUT https://api.elastic.io/v2/components/{COMPONENT_ID}/env`

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
The component should be accessible to the client (e.g. component from the own team or shared one) unless it has ``TenantAdmin`` role. Contact support team to get this role.



### Returns

Returns environment variables









