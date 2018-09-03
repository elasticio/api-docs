# Flow drafts

Request / Role| Tenant Admin | Workspace Admin | Integrator | Guest
---------- | :---------:| :------------:| :-----------:| :----------:
Retrieve a flow draft| X|X|X|X|
Create/update a flow draft|X |X|X|X|
Delete a flow draft|X |X|X|X|

## Retrieve a flow draft

> Example Request:


```shell
 curl https://api.elastic.io/v2/flows/{FLOW_ID}/draft \
   -X GET \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
```



> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data":{
    "id":"5abe0cabaa56a1749856226b",
    "type":"flow-draft",
    "links":{
      "self":"/v2/flows/5abbb9d4bc984b000739761a/draft"
    },
    "attributes":{
      "name":"2803ANode.js Code to E-Mail",
      "description":null,
      "cron":null,
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "command":"elasticio/timer:timer@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "command":"elasticio/email:send@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a"
          },
          {
            "id":"step_3",
            "command":"elasticio/code:execute@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a",
            "fields":{
              "code":"//Your NodeJS code"
            }
          }
        ],
        "edges":[
          {
            "id":"step_1:step_3",
            "source":"step_1",
            "target":"step_3"
          },
          {
            "id":"mapper:step_3:step_2",
            "config":{
              "mapper_type":"jsonata",
              "condition":null,
              "mapper":{
                "textBody":"message",
                "subject":"\"2803_SW)RT\"",
                "to":"\"test@example.com\""
              }
            },
            "source":"step_3",
            "target":"step_2"
          }
        ]
      },
      "created_at":"2018-03-30T10:08:43.582Z",
      "updated_at":"2018-03-30T10:08:43.582Z"
    },
    "relationships":{
      "user":{
        "data":{
          "id":"59d3562c68ed850019bde27f",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/59d3562c68ed850019bde27f"
        }
      },
      "flow":{
        "data":{
          "id":"5abbb9d4bc984b000739761a",
          "type":"flow"
        },
        "links":{
          "self":"/v2/flows/5abbb9d4bc984b000739761a"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to get a flow draft.

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}/draft`

### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| FLOW_ID   | yes      | Flow ID     |

### Returns

Returns a flow draft


## Create/update a flow draft

> Example Request:


```shell
 curl https://api.elastic.io/v2/flows/{FLOW_ID}/draft \
   -X PUT \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "data": {
        "type": "flow-draft",
        "attributes": {
          "name": "Timer to E-Mail",
          "description": "Some real description",
          "graph": {
            "nodes": [
              {
                "id": "step_1",
                "command": "elasticio/timer:timer",
                "fields": {
                  "interval": "minute"
                }
              },
              {
                "id": "step_2",
                "command": "elasticio/email:send"
              }
            ],
            "edges": [
              {
                "source": "step_1",
                "target": "step_2",
                "config": {
                  "mapper": {
                    "to": "info@acme.org",
                    "subject": "Test",
                    "textBody": "{{fireTime}}"
                  }
                }
              }
            ]
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
    "id":"5abe0cabaa56a1749856226b",
    "type":"flow-draft",
    "links":{
      "self":"/v2/flows/5abbb9d4bc984b000739761a/draft"
    },
    "attributes":{
      "name":"2803ANode.js Code to E-Mail",
      "description":null,
      "cron":null,
      "graph":{
        "nodes":[
          {
            "id":"step_1",
            "command":"elasticio/timer:timer@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a",
            "fields":{
              "interval":"minute"
            }
          },
          {
            "id":"step_2",
            "command":"elasticio/email:send@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a"
          },
          {
            "id":"step_3",
            "command":"elasticio/code:execute@latest",
            "name":"",
            "description":"",
            "agent_id":"5a09deda2d5f49665afb739a",
            "fields":{
              "code":"//Your NodeJS code"
            }
          }
        ],
        "edges":[
          {
            "id":"step_1:step_3",
            "source":"step_1",
            "target":"step_3"
          },
          {
            "id":"mapper:step_3:step_2",
            "config":{
              "mapper_type":"jsonata",
              "condition":null,
              "mapper":{
                "textBody":"message",
                "subject":"\"2803_SW)RT\"",
                "to":"\"test@example.com\""
              }
            },
            "source":"step_3",
            "target":"step_2"
          }
        ]
      },
      "created_at":"2018-03-30T10:08:43.582Z",
      "updated_at":"2018-03-30T10:08:43.582Z"
    },
    "relationships":{
      "user":{
        "data":{
          "id":"59d3562c68ed850019bde27f",
          "type":"user"
        },
        "links":{
          "self":"/v2/users/59d3562c68ed850019bde27f"
        }
      },
      "flow":{
        "data":{
          "id":"5abbb9d4bc984b000739761a",
          "type":"flow"
        },
        "links":{
          "self":"/v2/flows/5abbb9d4bc984b000739761a"
        }
      }
    }
  },
  "meta":{}
}
```

This resource allows you to create/update a flow draft.

### HTTP Request

`PUT https://api.elastic.io/v2/flows/{FLOW_ID}/draft`

### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| FLOW_ID   | yes      | Flow ID     |

### Body Parameters

| Parameter        | Required | Description |
| :--------------- | :------- | :---------- |
| type             |    yes   | A value must be ``flow-draft`` |
| attributes.name  |    no    | Flow name |
| attributes.description  |    no    | Flow description |
| attributes.graph |    no    | Flow graph representing component connections |
| attributes.cron  |    no    | Cron expression |


### Returns

Returns the created/updated flow draft


## Delete a flow draft

> Example Request:

```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID}/draft \
   -X DELETE \
   -u {EMAIL}:{APIKEY}
```


This resource allows you to delete a flow draft.

### HTTP Request

``DELETE https://api.elastic.io/v2/flows/{FLOW_ID}/draft``


### URL Parameters

| Parameter | Required | Description |
| :-------- | :------- | :---------- |
| FLOW_ID   | yes      | Flow ID     |

> Example Response:

```shell
HTTP/1.1 204 No Content
```
