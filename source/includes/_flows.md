# Flows

## Retrieve all flows


> Example Request (with custom paging):

```shell
 curl 'https://api.elastic.io/v2/flows?page[size]=20&page[number]=1' \
   -g \
   -u {EMAIL}:{APIKEY}
```


> Example Request (with filter):

```shell
 curl 'https://api.elastic.io/v2/flows?filter[status]=active' \
   -g \
   -u {EMAIL}:{APIKEY}
```


> Example Request (with custom sorting):

```shell 
 curl 'https://api.elastic.io/v2/flows?sort=-updated_at' \
   -g \
   -u {EMAIL}:{APIKEY}
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

This resource allows you to retrieve flows.

### HTTP Request

`GET https://api.elastic.io/v2/flows/`

### Query Parameters

| Parameter             | Required  | Description |
| :---                  | :---      | :--- |
| page[size]          | no        | Amount of items per page. Default is `50`. |
| page[number]        | no        | Number of page. Default is `1`. |
| filter[status]      | no        | Filter by `status`. May be any of: `active`, `inactive`. |
| filter[user]        | no        | Filter by `user`. Must be `id` of `User` who created the flow. `user` could be found in relationships of the flow. |
| filter[type]        | no        | Filter by flow `type`. May be any of: `ordinary`, `long_running`. |
| sort                  | no        | Sort flows list by certain field. May be `created_at`, `updated_at` or `title`. Prefix field name with `-` for reversed (desc) order e.g. `sort=-updated_at`. Default sort is by `id`. |

### Returns

Returns all flows belonging to the given user. If the user is a member of an organization,
all the flows of the organization are returned. If the user is a member in multiple organizations, the given API key is
used to match the proper organization.

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

This resource allows you to retrieve a flow by its identifier. If the flow with given ID does not belong to the current
user or to one of his organizations, an error is returned.

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
 curl https://api.elastic.io/v2/flows \
   -u {EMAIL}:{APIKEY} \
   -H 'Accept: application/json' \
   -H 'Content-Type: application/json' -d '
    {
      "data": {
        "type": "flow",
        "attributes": {
          "name": "Timer to E-Mail",
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

```javascript
TBD
```

> Example response

```http
HTTP/1.1 202 Accepted
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

```javascript
TBD
```

> Example response

```http
HTTP/1.1 202 Accepted
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

```
 TBD
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
