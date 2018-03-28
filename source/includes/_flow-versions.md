# Flow versions

## Retrieve all flow versions

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions?page[size]=20&page[number]=1 \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
   "data": [
      {
        "id": "af65130306caf1c421708a1cfe7edcb56900a6af",
        "type": "flow-version",
        "links": {
            "self": "/v2/flows/5ab0eeabbd6d6400079b4628/versions/af65130306caf1c421708a1cfe7edcb56900a6af"
        },
        "attributes": {
            "name": "Node.js Code to Node.js Code draft 2",
            "description": null,
            "graph": {
                "nodes": [
                    {
                        "id": "step_1",
                        "command": "elasticio/code:executeTrigger@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "//Your NodeJS code"
                        }
                      },
                    {
                        "id": "step_2",
                        "command": "elasticio/code:execute@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "// Your NodeJS code"
                        }
                    },
                    {
                        "id": "step_3",
                        "command": "elasticio/code:execute@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "// Your NodeJS code"
                        }
                    }
                ],
                "edges": [
                    {
                        "id": "step_1:step_2",
                        "source": "step_1",
                        "target": "step_2"
                    },
                    {
                        "id": "step_1:step_3",
                        "source": "step_1",
                        "target": "step_3"
                    }
                ]
            },
            "created_at": "2018-03-20T14:12:54.361Z"
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "59d22e7eeb865b0018adc248",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/59d22e7eeb865b0018adc248"
                }
            },
            "flow": {
                "data": {
                    "id": "5ab0eeabbd6d6400079b4628",
                    "type": "flow"
                },
                "links": {
                    "self": "/v2/flows/5ab0eeabbd6d6400079b4628"
                }
            }
        }
    },
      //...
   ],
   "meta": {
      "page": 1,
      "per_page": 50,
      "total": 1,
      "total_pages": 1
   }
}
```

These versions represent the history of changes of the flow and are sorted chronologically by `created_at`.

Each version has an `id` and represents a flow's state at the given `created_at` time.
It also exposes a relationship to the author of the change.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions`

### URL Parameters

| Parameter      | Required | Description                        | Default |
| :------------- | :------- | :----------------------------------| :------ |
| FLOW_ID        | Yes      | Flow identifier                    |         |
| page\[size\]   | No       | Amount of items per page           | 50      |
| page\[number\] | No       | Number of page you want to display | 1       |


### Returns

The list of versions for the specified flow.

## Retrieve flow version by hash

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH} \
   -u {EMAIL}:{APIKEY}
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "data": {
        "id": "af65130306caf1c421708a1cfe7edcb56900a6af",
        "type": "flow-version",
        "links": {
            "self": "/v2/flows/5ab0eeabbd6d6400079b4628/versions/af65130306caf1c421708a1cfe7edcb56900a6af"
        },
        "attributes": {
            "name": "Node.js Code to Node.js Code draft 2",
            "description": null,
            "graph": {
                "nodes": [
                    {
                        "id": "step_1",
                        "command": "elasticio/code:executeTrigger@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "//Your NodeJS code"
                        }
                      },
                    {
                        "id": "step_2",
                        "command": "elasticio/code:execute@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "// Your NodeJS code"
                        }
                    },
                    {
                        "id": "step_3",
                        "command": "elasticio/code:execute@latest",
                        "name": "",
                        "description": "",
                        "fields": {
                            "code": "// Your NodeJS code"
                        }
                    }
                ],
                "edges": [
                    {
                        "id": "step_1:step_2",
                        "source": "step_1",
                        "target": "step_2"
                    },
                    {
                        "id": "step_1:step_3",
                        "source": "step_1",
                        "target": "step_3"
                    }
                ]
            },
            "created_at": "2018-03-20T14:12:54.361Z"
        },
        "relationships": {
            "user": {
                "data": {
                    "id": "59d22e7eeb865b0018adc248",
                    "type": "user"
                },
                "links": {
                    "self": "/v2/users/59d22e7eeb865b0018adc248"
                }
            },
            "flow": {
                "data": {
                    "id": "5ab0eeabbd6d6400079b4628",
                    "type": "flow"
                },
                "links": {
                    "self": "/v2/flows/5ab0eeabbd6d6400079b4628"
                }
            }
        }
    },
    "meta": {}
}
```

This resource allows to you retrieve specific version of the flow by its version hash.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/versions/{VERSION_HASH}`

### URL Parameters

| Parameter    | Required | Description     |
| :----------- | :------- | :-------------- |
| FLOW_ID      | Yes      | Flow identifier |
| VERSION_HASH | Yes      | Version hash    |

### Returns

Specific version of the flow.
