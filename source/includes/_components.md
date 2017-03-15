# Components
[component-descriptor-doc]: https://support.elastic.io/support/solutions/articles/14000036334-component-descriptor-structure


## Component access and sharing
Each `Component` belongs to a `Team`. Each `User`  who is a member of the team can edit the component.
If a team is created in an `Organization`, it can be said that the component belongs to the organization transitively, so each member of the organization can edit the component.

Component has an attribute `access`, which describes if the component is shared for by the other clients. "Shared" means, that the component can be used by the users in their flows. 
There are three sharing modes: 

- `team` – no sharing. Only team members can use the component.
- `tenant` – component could be used by the other clients in the tenant.
- `global` – special mode for components from the standard set of components of Elastic.io Platform (e.g. `timer`, `webhook` etc). Any user of the Elastic.io Platform can use global component.


Accordingly, a set of components, available for each user is consist of: not shared components from the user's team, components with `tenant` access and `global` components.



##Retrieve components


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
            "type": "component",
            "id": "{COMPONENT_ID}",
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
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/latest"
                    },
                    "data": {
                        "type": "version",
                        "id": "{GIT_REVISION}"
                    }
                }
            },
            "included": [
                {
                    "type": "version",
                    "id": "{GIT_REVISION}",
                    "attributes": {
                        "date": 1487846132213,
                        "versionNumber": 1
                    },
                    "relationships": {
                        "descriptor": {
                            "links": {
                                "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                            }
                        }
                    }
                },
                {
                    "id": "{GIT_REVISION}",
                    "type": "descriptor",
                    "attributes": {
                        "description": "desc",
                        "icon": "BASE64",
                        "is_latest": true,
                        "language": "nodejs",
                        "repo_name": "repo_name",
                        "sailor_version": "1.0.0",
                        "team_name": "team_name",
                        "title": "title",
                        "triggers": {
                            "select": "<Triggers Object>"
                        },
                        "actions": {
                            "update": "<Actions Object>"
                        }
                    }
                }
            ]
        }
    ],
    "meta": {}
}
```

This endpoint retrieves a list of available components.
Response includes latest [descriptor](#retrieve-an-single-component-descriptor) for each component.
More details about component descriptors you can find [here][component-descriptor-doc].

### HTTP Request

`GET https://api.elastic.io/v2/components`


### URL Query Parameters
Parameter      | Required | Description
-------------- | -------- | ----------- 
filter[access] | no       | Allowed values: `private` (only components from own teams returned), `public` (only shared components from the other teams) and `all` (default value, returns all abailable components).  

### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon (base64 encoded)
triggers  | Object   | [&lt;Triggers Object&gt;][component-descriptor-doc]
actions   | Object   | [&lt;Actions Object&gt;][component-descriptor-doc]











## Retrieve a single component


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
    "data": 
        {
            "type": "component",
            "id": "{COMPONENT_ID}",
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
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/latest"
                    },
                    "data": {
                        "type": "version",
                        "id": "{GIT_REVISION}"
                    }
                }
            },
            "included": [
                {
                    "type": "version",
                    "id": "{GIT_REVISION}",
                    "attributes": {
                        "date": 1487846132213,
                        "versionNumber": 1
                    },
                    "relationships": {
                        "descriptor": {
                            "links": {
                                "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                            }
                        }
                    }
                },
                {
                    "id": "{GIT_REVISION}",
                    "type": "descriptor",
                    "attributes": {
                        "description": "desc",
                        "icon": "BASE64",
                        "is_latest": true,
                        "language": "nodejs",
                        "repo_name": "repo_name",
                        "sailor_version": "1.0.0",
                        "team_name": "team_name",
                        "title": "title",
                        "triggers": {
                            "select": "<Triggers Object>"
                        },
                        "actions": {
                            "update": "<Actions Object>"
                        }
                    }
                }
            ]
        },
        "meta": {}
    }
```


### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}`


#### Authorization
The component should be accessible for the client (e.g. component from own team or shared one) unless it has `TenantAdmin` role. Contact support team to get this role.
  

### Returns

This endpoint returns a component object and includes latest [descriptor](#retrieve-an-single-component-descriptor) for each component.


### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon (base64 encoded)
triggers  | Object   | [&lt;Triggers Object&gt;][component-descriptor-doc]
actions   | Object   | [&lt;Actions Object&gt;][component-descriptor-doc]





















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
            "type": "version",
            "id": "{GIT_REVISION}",
            "relationships": {
                "descriptor": {
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                    }
                }
            }
        },
        {
            "type": "version",
            "id": "{GIT_REVISION}",
            "attributes": {
                "date": 1487846132213,
                "versionNumber": 1
            },
            "relationships": {
                 "component": {
                    "data": {
                        "id": {COMPONENT_ID},
                        "type": 'component'
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}"
                    }
                },
                "descriptor": {
                    "data": {
                        "id": {GIT_REVISION},
                        "type": 'descriptor'
                    },
                    "links": {
                        "self": "/v2/components/{COMPONENT_ID}/versions/{GIT_REVISION}/descriptor"
                    }
                }
            }
        }
    ],
    "meta": {}
}
```

This endpoint retrieves list of component's versions

### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/versions`


#### Authorization
The component should be accessible for the client (e.g. component from own team or shared one) unless it has `TenantAdmin` role. Contact support team to get this role.


### Returns

Returns repositories build metadata object if the call succeeded.











##Retrieve a single component descriptor


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
        "attributes": {
            "description": "desc",
            "icon": "BASE64",
            "is_latest": true,
            "language": "nodejs",
            "repo_name": "repo_name",
            "sailor_version": "1.0.0",
            "team_name": "team_name",
            "title": "title",
            "triggers": {
                "select": "<Triggers Object>"
            },
            "actions": {
                "update": "<Actions Object>"
            }
        }
    },
    "meta": {}
}
```

This endpoint retrieves an information about single component by it's ID and/or version, for latest version type `latest`
More details you can find [here]([component-descriptor-doc]).

### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/version/{GIT_REVISION}/descriptor`

or

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/version/latest/descriptor`



### URL Parameters

Parameter    | Description
------------ | -----------
COMPONENT_ID | The ID of a user
GIT_REVISION | Revision of the component's build. Also there is "keyword" `latest` which means the most recent successful build.


#### Authorization
The component should be accessible for the client (e.g. component from own team or shared one) unless it has `TenantAdmin` role. Contact support team to get this role.

  


### Returns

Returns component [descriptor][component-descriptor-doc] if the call succeeded.













##Create component repository


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
HTTP/1.1 200 OK
Content-Type: application/json
{
    "data": {
        "type": "component",
        "id": "58a410b58224d9b2f99a687b",
        "attributes": {
            "name": "mycomponent",
            "team_name": "my_hackers",
            "icon": "{BASE64_ICON}
        },
        "relationships": {
            "versions": {
                "links": {
                    "related": "/v2/components/58a410b58224d9b2f99a687b/versions"
                }
            }
        }
    },
    "meta": {}
}
```

This endpoint creates repository for component

### Returns

Returns component's metadata object if the call succeeded.














## Update component access

Allows changing `access` from `team` to `tenant` [mode](#component-access-and-sharing).

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
        "type": "component",
        "id": "58a410b58224d9b2f99a687b",
        "attributes": {
            "name": "mycomponent",
            "team_name": "my_hackers"
        },
        "relationships": {
            "versions": {
                "links": {
                    "related": "/v2/components/58a410b58224d9b2f99a687b/versions"
                }
            }
        }
    },
    "meta": {}
}
```

#### Authorization
This request is authorized for a user with `TenantAdmin` role only. Contact support team to get this role.


### Returns
Returns updated component's metadata object if the call succeeded.














##Remove a component


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
HTTP/1.1 200 OK
Content-Type: application/json
```

This endpoint remove component from the database. Component's slugs will be removed later automatically (TBD).



### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/`


#### Authorization
The component should belong to one of the client's team or organization respectively unless it has `TenantAdmin` role. Contact support team to get this role.


### Returns

200 HTTP response code if the call succeeds, error otherwise.














##Get component's environment variables


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
        "id": "{REPO_ID}",
        "type": "component-env"
    },
    "meta": {}
}
```

This endpoint shows env vars for given component.


### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/env`


#### Authorization
The component should be accessible for the client (e.g. component from own team or shared one) unless it has `TenantAdmin` role. Contact support team to get this role.


### Returns

Returns environment variables














##Set component's environment variables


> Example Request:

```shell
curl https://api.elastic.io/v2/components/{COMPONENT_ID}/env \
   -X PUT
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json'
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
        "id": "{REPO_ID}",
        "type": "component-env"
    },
    "meta": {}
}
```

This endpoint replaces env vars for given component.



### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/env`


#### Authorization
The component should belong to one of the client's team or organization respectively unless it has `TenantAdmin` role. Contact support team to get this role.



### Returns

Returns environment variables









