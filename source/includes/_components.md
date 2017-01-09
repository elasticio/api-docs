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
                "teamName": "my_hackers"
            },
            "relationships": {
                "versions": {
                    "links": {
                        "related": "/v2/components/{COMPONENT_ID}/versions"
                    }
                },
                "latestVersion": {
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
                        "isLatest": true,
                        "language": "nodejs",
                        "repo_name": "repo_name",
                        "sailor_version": "1.0.0",
                        "team_name": "my_hackers",
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
            "isLatest": true,
            "language": "nodejs",
            "repo_name": "repo_name",
            "sailor_version": "1.0.0",
            "team_name": "my_hackers",
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
