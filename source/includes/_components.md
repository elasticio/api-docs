# Components

## Retrieve components


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

This endpoint retrieves list of available to user components.
Response include latest descriptor for each component
More details you can find [here](http://docs.elastic.io/docs/component-descriptor).

### HTTP Request

`GET https://api.elastic.io/v2/components`


### Returns

Returns repositories metadata object if the call succeeded.

### Response fields

Field     | Type     | Description
--------- | ---------| --------------------------
icon      | String   | Icon in base64
triggers  | Object   | [&lt;Triggers Object&gt;](http://docs.elastic.io/docs/component-descriptor#triggers-object)
actions   | Object   | [&lt;Actions Object&gt;](http://docs.elastic.io/docs/component-descriptor#actions-object)

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
                "descriptor": {
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


### Returns

Returns repositories build metadata object if the call succeeded.

## Retrieve an single component descriptor


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
        "id": "{GIT_HASH}",
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
More details you can find [here](http://docs.elastic.io/docs/component-descriptor).

### HTTP Request

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/version/{GIT_HASH}/descriptor`

or

`GET https://api.elastic.io/v2/components/{COMPONENT_ID}/version/latest/descriptor`


### Returns

Returns repositories metadata object if the call succeeded.


## Create component repository


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

This request will make component accessible to all users in tenant, action is irreversible.
Request could be done only by tenant admin.

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

This endpoint updates component access.

### Returns

Returns component's metadata object if the call succeeded.


## Remove component repository


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

This endpoint remove component from the database.

### Returns

200 http response code if call succeed, error otherwise.


## Get component's environment variables


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

### Returns

Returns environment variables


## Set component's environment variables


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

### Returns

Returns environment variables









