#Tasks

## Retrieve all tasks


> Example Request:


```shell
 curl https://api.elastic.io/v2/tasks \
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
    "data": [
        {
            "type": "task",
            "id": "585918da586224001b96de89",
            "attributes": {
              "name": "Timer to E-Mail Test",
              "status": "inactive",
              "type": "ordinary",
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
                        "to": "igor@elastic.io",
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
              "organization": {
                "data": {
                  "type": "organization",
                  "id": "573dd76962436c349f000003"
                },
                "links": {
                  "self": "/v2/organizations/573dd76962436c349f000003"
                }
              }
            }
        }
    ],
    "meta": {
        "page": 1,
        "per_page": 50,
        "total": 1,
        "total_pages": 1
    }

}
```

This endpoint retrieves all tasks for user or organization

### HTTP Request

`GET https://api.elastic.io/v2/tasks/`

### Returns

Returns all tasks belonging to user or organization.

## Retrieve a task by ID

> Example Request:


```shell
curl https://api.elastic.io/v2/tasks/{TASK_ID} \
   -u {EMAIL}:{APIKEY}
```

```javascript
TDB
```

> Example Response:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "type": "task",
    "id": "585918da586224001b96de89",
    "attributes": {
      "name": "Timer to E-Mail Test",
      "status": "inactive",
      "type": "ordinary",
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
                "to": "igor@elastic.io",
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
      "organization": {
        "data": {
          "type": "organization",
          "id": "573dd76962436c349f000003"
        },
        "links": {
          "self": "/v2/organizations/573dd76962436c349f000003"
        }
      }
    }
  },
  "meta": {}
}
```

This endpoint returns a task for given ID

### HTTP Request

`POST https://api.elastic.io/v2/tasks/{TASK_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
TASK_ID | The ID of the task to retrieve


### Returns

The task with given ID