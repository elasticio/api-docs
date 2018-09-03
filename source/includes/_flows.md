# Flows

Request / Role | Tenant Admin | Workspace Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Retrieve all flows|- |X|X|X|
Retrieve a flow by ID|- |X|X|X|
Create a flow|- |X|X|-|
Update a flow|- |X|X|-|
Start a flow|X |X|X|-|
Stop a flow|X |X|X|-|
Delete a flow|- |X|X|-|

## Retrieve all flows


> Example Request (with custom paging):

```shell
 curl 'https://api.elastic.io/v2/flows?page[size]=20&page[number]=1' \
   -g -u {EMAIL}:{APIKEY}
```


> Example Request (with filter):

```shell
 curl 'https://api.elastic.io/v2/flows?filter[status]=active' \
   -g -u {EMAIL}:{APIKEY}
```


> Example Request (with search):

```shell
 curl 'https://api.elastic.io/v2/flows?search=webhook' \
   -g -u {EMAIL}:{APIKEY} 
```


> Example Request (with custom sorting):

```shell 
 curl 'https://api.elastic.io/v2/flows?sort=-updated_at' \
   -g -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":[
    {
      "type":"flow",
      "id":"585918da586224001b96de89",
      "links":{
        "self":"/v2/flows/585918da586224001b96de89"
      },
      "attributes":{
        "name":"Timer to E-Mail Test",
        "status":"inactive",
        "type":"ordinary",
        "created_at":"2018-03-27T15:39:02.825Z",
        "current_status":"inactive",
        "default_mapper_type":"jsonata",
        "description":"",
        "updated_at":"2018-03-27T15:39:02.923Z",
        "graph":{
          "nodes":[
            {
              "id":"step_1",
              "component_id": "55ba18e35d04040500000004",
              "command":"elasticio/timer:timer",
              "name":"",
              "description":"",
              "fields":{
                "interval":"minute"
              }
            },
            {
              "id":"step_2",
              "component_id": "593809a16b1d1f00196b74cd",
              "command":"elasticio/email:send",
              "name":"",
              "description":""
            }
          ],
          "edges":[
            {
              "id":"mapper:step_1:step_2",
              "config":{
                "mapper_type":"jsonata",
                "condition":null,
                "mapper":{
                  "to":"\"test@example.com\"",
                  "subject":"\"StrongMapper\"",
                  "textBody":"Address.Street"
                }
              },
              "source":"step_1",
              "target":"step_2"
            }
          ]
        }
      },
      "relationships":{
        "user":{
          "data":{
            "type":"user",
            "id":"560e5a27734d480a00000002"
          },
          "links":{
            "self":"/v2/users/560e5a27734d480a00000002"
          }
        },
        "workspace":{
          "data":{
            "type":"workspace",
            "id":"573dd76962436c349f000003"
          },
          "links":{
            "self":"/v2/workspaces/573dd76962436c349f000003"
          }
        },
        "versions":{
          "links":{
            "related":"/v2/flows/585918da586224001b96de89/versions"
          }
        },
        "latest_version":{
          "data":{
            "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
            "type":"flow-version"
          },
          "links":{
            "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
            "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
          }
        }
      }
    }
  ],
  "meta":{
    "page":1,
    "per_page":10,
    "total":2,
    "total_pages":1
  },
  "links":{
    "self":"/v2/flows"
  }
}
```

This resource allows you to retrieve flows.

### HTTP Request

`GET https://api.elastic.io/v2/flows/`

### Query Parameters

| Parameter         | Required  | Description |
| :---              | :---      | :---        |
| page[size]        | no | Amount of items per page. Default is `50`. |
| page[number]      | no | Number of page you want to display. Default is `1`. |
| filter[has_draft] | no | Filter flows only with or without a draft. May be `true` or `false`. |
| filter[status]    | no | Filter by `status`. May be any of: `active`, `inactive`. |
| filter[type]      | no | Filter by flow `type`. May be any of: `ordinary`, `long_running`. |
| filter[user]      | no | Filter by `user`. Must be `id` of `User` who created the flow. `User` could be found in relationships of the flow. |
| sort              | no | Sort flows list by certain field. May be `created_at`, `updated_at` or `name`. Prefix field name with `-` for reversed (desc) order e.g. `sort=-updated_at`. Default sort is by `id`. |
| search            | no | Search flows by a word or a phrase contained in a `description` OR in a `name`. Behavior is similar to operator `LIKE` in SQL. Case insensitive. Leading/following spaces are trimmed. |

### Returns

Returns all flows belonging to the given user. If the user is a member of a Workspace,
all the flows of the Workspace are returned. If the user is a member in multiple Workspaces, the given API key is
used to match the proper Workspace.

## Retrieve a flow by ID

> Example Request:


```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -u {EMAIL}:{APIKEY}
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"Timer to E-Mail Test",
      "status":"inactive",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":"",
      "updated_at":"2018-03-27T15:39:02.923Z",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id": "55ba18e35d04040500000004",
            "command":"elasticio/timer:timer",
            "name":"",
            "description":"",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "component_id": "593809a16b1d1f00196b74cd",
            "command":"elasticio/email:send",
            "name":"",
            "description":""
          }
        ],
        "edges":[
          {
            "id":"mapper:step_1:step_2",
            "config":{
              "mapper_type":"jsonata",
              "condition":null,
              "mapper":{
                "to":"\"test@example.com\"",
                "subject":"\"StrongMapper\"",
                "textBody":"Address.Street"
              }
            },
            "source":"step_1",
            "target":"step_2"
          }
        ]
      }
    },
    "relationships":{
      "user":{
        "data":{
          "type":"user",
          "id":"560e5a27734d480a00000002"
        },
        "links":{
          "self":"/v2/users/560e5a27734d480a00000002"
        }
      },
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"573dd76962436c349f000003"
        },
        "links":{
          "self":"/v2/workspaces/573dd76962436c349f000003"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/585918da586224001b96de89/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
          "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to retrieve a flow by its identifier. If the flow with given ID does not belong to the current
user or to one of his Workspace, an error is returned.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}`


### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |


### Returns

The flow with given ID


## Create a flow

> Example Request:


```shell
 curl -X POST https://api.elastic.io/v2/flows \
  -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
     {
    "data": {
        "attributes": {
            "default_mapper_type": "jsonata",
            "type": "ordinary",
            "name": "Timer to E-Mail",
            "description": null,
            "cron": null,
            "graph": {
                "nodes": [
                    {
                        "id": "step_1",
                        "command": "elasticio/timer:timer@latest",
                        "fields": {
                            "interval": "minute"
                        }
                     },
                    {
                        "command": "elasticio/email:send@latest",
                        "fields": {},
                        "id": "step_2"
                                            }
                ],
                "edges": [
                    {
                        "config": {
                            "mapper_type": "jsonata",
                            "mapper": {
                                "to": "info@acme.org",
                                "subject": "Subject",
                                "textBody": "fireTime"
                            }
                           },
                        "source": "step_1",
                        "target": "step_2"
                    }
                ]
            }
        },
        "type": "flow"
    }
}'

```



> Example Response:

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"Timer to E-Mail Test",
      "status":"inactive",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":null,
      "updated_at":"2018-03-27T15:39:02.923Z",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id": "55bb6a58fa35a40c00000009",
            "command":"elasticio/timer:timer",
            "name":"",
            "description":"",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "component_id": "55bb491dfa35a40c00000006",
            "command":"elasticio/email:send",
            "name":"",
            "description":""
          }
        ],
        "edges":[
          {
            "source":"step_1",
            "target":"step_2",
            "config":{
              "mapper":{
                "to":"info@acme.org",
                "subject":"Test",
                "textBody":"FireTime"
              }
            }
          }
        ]
      }
    },
    "relationships":{
      "user":{
        "data":{
          "type":"user",
          "id":"560e5a27734d480a00000002"
        },
        "links":{
          "self":"/v2/users/560e5a27734d480a00000002"
        }
      },
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"573dd76962436c349f000003"
        },
        "links":{
          "self":"/v2/workspaces/573dd76962436c349f000003"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/585918da586224001b96de89/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
          "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create a new flow.

### HTTP Request

`POST https://api.elastic.io/v2/flows/`

### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``flow`` |
| attributes.name | yes | Flow name |
| attributes.type | yes | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph | yes | Flow graph representing component connections |


### Returns

Returns the created flow

## Update a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -X PATCH \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
          "data": {
            "type": "flow",
            "id": "{FLOW_ID}",
            "attributes": {
              "name": "this is a test task"
            }
          }
    }'

```


> Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "type":"flow",
    "id":"585918da586224001b96de89",
    "links":{
      "self":"/v2/flows/585918da586224001b96de89"
    },
    "attributes":{
      "name":"Timer to E-Mail Test",
      "status":"inactive",
      "type":"ordinary",
      "created_at":"2018-03-27T15:39:02.825Z",
      "current_status":"inactive",
      "default_mapper_type":"jsonata",
      "description":null,
      "updated_at":"2018-03-27T15:39:02.923Z",
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "component_id": "55ba18e35d04040500000004",
            "command":"elasticio/timer:timer",
            "name":"",
            "description":"",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "component_id": "593809a16b1d1f00196b74cd",
            "command":"elasticio/email:send",
            "name":"",
            "description":""
          }
        ],
        "edges":[
          {
            "source":"step_1",
            "target":"step_2",
            "config":{
              "mapper":{
                "to":"info@acme.org",
                "subject":"Test",
                "textBody":"FireTime"
              }
            }
          }
        ]
      }
    },
    "relationships":{
      "user":{
        "data":{
          "type":"user",
          "id":"560e5a27734d480a00000002"
        },
        "links":{
          "self":"/v2/users/560e5a27734d480a00000002"
        }
      },
      "workspace":{
        "data":{
          "type":"workspace",
          "id":"573dd76962436c349f000003"
        },
        "links":{
          "self":"/v2/workspaces/573dd76962436c349f000003"
        }
      },
      "versions":{
        "links":{
          "related":"/v2/flows/585918da586224001b96de89/versions"
        }
      },
      "latest_version":{
        "data":{
          "id":"787513ee82625ef46bc10372cb6485a535b54c5f",
          "type":"flow-version"
        },
        "links":{
          "self":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f",
          "related":"/v2/flows/585918da586224001b96de89/versions/787513ee82625ef46bc10372cb6485a535b54c5f"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to update the given flow.

### HTTP Request

`PATCH https://api.elastic.io/v2/flows/{FLOW_ID}`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| FLOW_ID | yes | Flow ID |



### Body Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- |
| type | yes | A value must be ``flow`` |
| id | yes | ID of the flow you want to update
| attributes.name | no | Flow name |
| attributes.type | no | Flow type. May be any of: ``ordinary``, ``long_running`` |
| attributes.graph | no | Flow graph representing component connections |
| attributes.cron | no | Cron expression representing flow timing |

### Returns

Returns the updated flow

## Start a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/start \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```


> Example response

```http
HTTP/1.1 202 Accepted
{
  "data":{},
  "meta":{}
}
```

This endpoint starts a flow with given ID.

### HTTP Request

`POST https://api.elastic.io/v2/flows/{FLOW_ID}/start`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Returns

Empty response


## Stop a flow

> Example request

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/stop \
   -X POST \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```


> Example response

```http
HTTP/1.1 202 Accepted
{
  "data":{},
  "meta":{}
}
```

This endpoint stops a flow with given ID.

### HTTP Request

`POST https://api.elastic.io/v2/flows/{FLOW_ID}/stop`

### URL Parameters

| Parameter | Required | Description |
| :--- | :--- | :--- | :--- |
| FLOW_ID | Yes | Flow identifier |

### Returns

Empty response

## Delete a flow

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete a flow.

### HTTP Request

``DELETE https://api.elastic.io/v2/flows/{FLOW_ID}``


### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| FLOW_ID   | yes      | Flow ID     |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
