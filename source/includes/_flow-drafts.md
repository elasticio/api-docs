# Flow drafts

## Retrieve a flow draft

> Example Request:


```shell
 curl https://api.elastic.io/v2/flows/{FLOW_ID}/draft \
   -X GET \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json'
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
    "type": "flow-draft",
    "id": "{DRAFT_ID}",
    "attributes": {
      "name": "Timer to E-Mail Test",
      "description": "Some real description",
      "cron": "*/3 * * * *",
      "created_at": "2017-11-28T15:07:48.566Z",
      "updated_at": "2017-11-28T15:07:48.566Z",
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
    },
    "relationships": {
      "user": {
        "data": {
          "type": "user",
          "id": "560e5a27734d480a00000002"
        },
        "links": {
          "self": "/v2/users/560e5a27734d480a00000002"
        }
      },
      "flow": {
        "data": {
          "type": "flow",
          "id": "573dd76962436c349f000003"
        },
        "links": {
          "self": "/v2/flows/573dd76962436c349f000003"
        }
      }
    }
  },
  "meta": {}
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


```javascript
TBD
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "type": "flow-draft",
    "id": "{DRAFT_ID}",
    "attributes": {
      "name": "Timer to E-Mail Test",
      "description": "Some real description",
      "cron": "*/3 * * * *",
      "created_at": "2017-11-28T15:07:48.566Z",
      "updated_at": "2017-11-28T15:07:48.566Z",
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
    },
    "relationships": {
      "user": {
        "data": {
          "type": "user",
          "id": "560e5a27734d480a00000002"
        },
        "links": {
          "self": "/v2/users/560e5a27734d480a00000002"
        }
      },
      "flow": {
        "data": {
          "type": "flow",
          "id": "573dd76962436c349f000003"
        },
        "links": {
          "self": "/v2/flows/573dd76962436c349f000003"
        }
      }
    }
  },
  "meta": {}
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

```
 TBD
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