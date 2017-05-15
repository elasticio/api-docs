# Flows

## Retrieve all flows


> Example Request:


```shell
 curl https://api.elastic.io/v2/flows?page[size]=20&page[number]=1 \
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
            "type": "flow",
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
        "per_page": 20,
        "total": 1,
        "total_pages": 1
    }

}
```

This endpoint retrieves all flows for user or organization

### HTTP Request

`GET https://api.elastic.io/v2/flows/`

### URL Query Parameters

Parameter   | Required | Description              | Default
----------- | -------- | ------------------------ | -----------
page[size]  | No       | Amount of items per page | 50
page[number]| No       | Number of page           | 1

### Returns

Returns all flows belonging to user or organization.

## Retrieve a flow by ID

> Example Request:


```shell
curl https://api.elastic.io/v2/flows/{FLOW_ID} \
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
    "type": "flow",
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

This endpoint returns a flow for given ID

### HTTP Request

`GET https://api.elastic.io/v2/flows/{FLOW_ID}`


### URL Parameters

Parameter | Description
--------- | -----------
FLOW_ID   | The ID of the flow to retrieve


### Returns

The flow with given ID


## Create a flow

> Example Request:


```shell
 curl https://api.elastic.io/v2/flows \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "data": {
        "type": "flow",
        "attributes": {
          "name": "Timer to E-Mail",
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
HTTP/1.1 201 Created
Content-Type: application/json

{
  "data": {
    "type": "flow",
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

This endpoint creates a flow for current user or his organization

### HTTP Request

`POST https://api.elastic.io/v2/flows/`

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
type | yes | A value should be "flow"
attributes.name | yes | Flow name
attributes.status | yes | Flow status. May be any of: active, inactive
attributes.type | yes | Flow type. May be any of: ordinary, long_running
attributes.graph | yes | Flow graph representing component connections


### Returns

Returns the created flow

## Update flow

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

```javascript
TBD
```

> Example response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "data": {
    "id": "58f07f67401e5f0019275306",
    "type": "flow",
    "links": {
      "self": "/v2/flows/58f07f67401e5f0019275306"
    },
    "attributes": {
      "name": "this is a test task",
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
                "textBody": "{{fireTime}}",
                "subject": "Test",
                "to": "info@acme.org"
              }
            }
          }
        ]
      },
      "api_version": "2.0"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "58c91bd02e669f0019243fdf",
          "type": "user"
        },
        "links": {
          "self": "/v2/users/58c91bd02e669f0019243fdf"
        }
      },
      "organization": {
        "data": {
          "id": "57595b65cc6b4b0000000003",
          "type": "organization"
        },
        "links": {
          "self": "/v2/organizations/57595b65cc6b4b0000000003"
        }
      }
    }
  },
  "meta": {}
}
```

This endpoint updates a flow with given ID.
Note: if you apply changes that affect timing (cron field) of triggering 
(i.e. flow graph first node is changed to webhook from polling trigger and vice versa), 
you should restart your flow in order for this changes to take effect.

### HTTP Request

`PATCH https://api.elastic.io/v2/flows/{FLOW_ID}`

### URL Parameters

Parameter | Description
--------- | -----------
FLOW_ID   | The ID of the flow to retrieve

### Arguments

Parameter | Required | Description
--------- | ----------- | -----------
type | yes | A value should be "flow"
id | yes | ID of the flow you want to update
attributes.name | no | Flow name
attributes.status | no | Flow status. May be any of: active, inactive
attributes.type | no | Flow type. May be any of: ordinary, long_running
attributes.graph | no | Flow graph representing component connections
attributes.cron | no | Cron expression representing flow timing

### Returns

Returns the updated flow
